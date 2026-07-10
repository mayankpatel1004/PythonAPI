import os
from flask import Blueprint, request, jsonify
from middleware import token_required, role_required
from db import db
from utils.file_upload import save_uploaded_file

items_bp = Blueprint('items', __name__, url_prefix='/api/items')

# ------------------- GET all items (list) -------------------
@items_bp.route('/', methods=['GET'])
@token_required
def get_items():
    item_type = request.args.get('item_type')
    query = """SELECT item_id, item_title, item_alias, item_type, item_description,
                      item_shortdescription, attachment1, attachment2, controller,
                      action, published_at, published_end_at, meta_title,
                      meta_description, display_order, display_status,
                      created_at, updated_at
               FROM items WHERE deleted_status = 'N'"""
    params = []
    if item_type:
        query += " AND item_type = %s"
        params.append(item_type)
    query += " ORDER BY display_order"

    items = db.execute_query(query, params)
    return jsonify(items), 200

# ------------------- GET a single item -------------------
@items_bp.route('/<int:item_id>', methods=['GET'])
@token_required
def get_item(item_id):
    item = db.execute_one(
        """SELECT item_id, item_title, item_alias, item_type, item_description,
                  item_shortdescription, attachment1, attachment2, controller,
                  action, published_at, published_end_at, meta_title,
                  meta_description, display_order, display_status,
                  created_at, updated_at, user_id, item_parent
           FROM items
           WHERE item_id = %s AND deleted_status = 'N'""",
        (item_id,)
    )
    if not item:
        return jsonify({'message': 'Item not found'}), 404
    return jsonify(item), 200

# ------------------- CREATE a new item (supports JSON & form-data) -------------------
@items_bp.route('/', methods=['POST'])
@token_required
@role_required([1, 2])
def create_item():
    # Determine if request is JSON or multipart/form-data
    if request.content_type and 'multipart/form-data' in request.content_type:
        # Extract data from form
        data = request.form.to_dict()
        # Handle file uploads
        attachment1 = save_uploaded_file(request.files.get('attachment1'))
        attachment2 = save_uploaded_file(request.files.get('attachment2'))
        if attachment1:
            data['attachment1'] = attachment1
        if attachment2:
            data['attachment2'] = attachment2
    else:
        # JSON request
        data = request.get_json()
        if not data:
            return jsonify({'message': 'Invalid JSON or form-data'}), 400

    # Validate required fields
    required = ['item_title', 'item_type']
    if not all(k in data for k in required):
        return jsonify({'message': 'Missing required fields: item_title, item_type'}), 400

    # Generate alias if not provided
    alias = data.get('item_alias')
    if not alias:
        alias = data['item_title'].lower().replace(' ', '-').replace('&', 'and')

    parent = data.get('item_parent', 0)
    user_id = data.get('user_id', 0)
    controller = data.get('controller', '')
    action = data.get('action', 'index')
    published_at = data.get('published_at')
    published_end_at = data.get('published_end_at')

    insert_id = db.execute_insert(
        """INSERT INTO items
           (site_id, item_title, item_alias, item_parent, item_type,
            item_sections_id, item_description, attachment1, attachment2,
            item_shortdescription, user_id, controller, action,
            published_at, published_end_at, meta_title, meta_description,
            display_order, display_status,
            created_by, created_by_name, created_by_role, created_at, updated_at)
           VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s,
                   %s, %s, %s, %s, %s, %s, %s, %s, %s, NOW(), NOW())""",
        (
            0,  # site_id default
            data['item_title'],
            alias,
            parent,
            data['item_type'],
            data.get('item_sections_id'),
            data.get('item_description', ''),
            data.get('attachment1'),
            data.get('attachment2'),
            data.get('item_shortdescription', ''),
            user_id,
            controller,
            action,
            published_at,
            published_end_at,
            data.get('meta_title', ''),
            data.get('meta_description', ''),
            data.get('display_order', 0),
            data.get('display_status', 'Y'),
            request.user_id,
            '',  # created_by_name (optional)
            request.role_id
        )
    )
    return jsonify({'id': insert_id, 'message': 'Item created'}), 201

# ------------------- UPDATE an existing item -------------------
@items_bp.route('/<int:item_id>', methods=['PUT'])
@token_required
@role_required([1, 2])
def update_item(item_id):
    # Check if item exists
    existing = db.execute_one(
        "SELECT item_id, attachment1, attachment2 FROM items WHERE item_id = %s AND deleted_status = 'N'",
        (item_id,)
    )
    if not existing:
        return jsonify({'message': 'Item not found'}), 404

    # Determine request type
    if request.content_type and 'multipart/form-data' in request.content_type:
        data = request.form.to_dict()
        # Handle file uploads – if new file, replace old one
        attachment1 = save_uploaded_file(request.files.get('attachment1'))
        attachment2 = save_uploaded_file(request.files.get('attachment2'))
        if attachment1:
            data['attachment1'] = attachment1
        if attachment2:
            data['attachment2'] = attachment2
    else:
        data = request.get_json()
        if not data:
            return jsonify({'message': 'Invalid JSON or form-data'}), 400

    # Allowed fields to update
    allowed_fields = [
        'item_title', 'item_alias', 'item_parent', 'item_type',
        'item_sections_id', 'item_description', 'attachment1', 'attachment2',
        'item_shortdescription', 'user_id', 'controller', 'action',
        'published_at', 'published_end_at', 'meta_title', 'meta_description',
        'display_order', 'display_status'
    ]
    updates = []
    values = []
    for field in allowed_fields:
        if field in data:
            updates.append(f"{field} = %s")
            values.append(data[field])

    if not updates:
        return jsonify({'message': 'No fields to update'}), 400

    values.append(item_id)
    query = f"UPDATE items SET {', '.join(updates)}, updated_at = NOW() WHERE item_id = %s AND deleted_status = 'N'"
    db.execute_query(query, values, commit=True)
    return jsonify({'message': 'Item updated'}), 200

# ------------------- DELETE an item (soft delete) -------------------
@items_bp.route('/<int:item_id>', methods=['DELETE'])
@token_required
@role_required([1, 2])
def delete_item(item_id):
    existing = db.execute_one(
        "SELECT item_id FROM items WHERE item_id = %s AND deleted_status = 'N'",
        (item_id,)
    )
    if not existing:
        return jsonify({'message': 'Item not found'}), 404

    db.execute_query(
        """UPDATE items
           SET deleted_status = 'Y', deleted_by = %s, deleted_time = NOW()
           WHERE item_id = %s""",
        (request.user_id, item_id),
        commit=True
    )
    return jsonify({'message': 'Item deleted'}), 200