from flask import Blueprint, request, jsonify
from middleware import token_required, role_required
from db import db

items_bp = Blueprint('items', __name__, url_prefix='/api/items')

@items_bp.route('/', methods=['GET'])
@token_required
def get_items():
    # Optional filter by item_type
    item_type = request.args.get('item_type')
    query = "SELECT item_id, item_title, item_alias, item_type, item_description, attachment1, " \
            "published_at, display_status FROM items WHERE deleted_status = 'N'"
    params = []
    if item_type:
        query += " AND item_type = %s"
        params.append(item_type)
    query += " ORDER BY display_order"
    items = db.execute_query(query, params)
    return jsonify(items), 200

@items_bp.route('/', methods=['POST'])
@token_required
@role_required([1, 2])
def create_item():
    data = request.get_json()
    required = ['item_title', 'item_type']
    if not all(k in data for k in required):
        return jsonify({'message': 'Missing required fields'}), 400

    alias = data.get('item_alias') or data['item_title'].lower().replace(' ', '-')
    # Check for duplicate alias? Not necessary.

    insert_id = db.execute_insert(
        """INSERT INTO items 
           (item_title, item_alias, item_type, item_description, item_shortdescription,
            attachment1, attachment2, controller, action, published_at, published_end_at,
            meta_title, meta_description, display_order, display_status, created_by, created_by_name,
            created_by_role, created_at, updated_at)
           VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, NOW(), NOW())""",
        (
            data['item_title'],
            alias,
            data['item_type'],
            data.get('item_description', ''),
            data.get('item_shortdescription', ''),
            data.get('attachment1'),
            data.get('attachment2'),
            data.get('controller', ''),
            data.get('action', 'index'),
            data.get('published_at'),
            data.get('published_end_at'),
            data.get('meta_title', ''),
            data.get('meta_description', ''),
            data.get('display_order', 0),
            data.get('display_status', 'Y'),
            request.user_id,
            '',  # created_by_name could be fetched
            request.role_id
        )
    )
    return jsonify({'id': insert_id, 'message': 'Item created'}), 201

@items_bp.route('/<int:item_id>', methods=['PUT'])
@token_required
@role_required([1, 2])
def update_item(item_id):
    data = request.get_json()
    allowed_fields = ['item_title', 'item_alias', 'item_type', 'item_description',
                      'item_shortdescription', 'attachment1', 'attachment2', 'controller',
                      'action', 'published_at', 'published_end_at', 'meta_title',
                      'meta_description', 'display_order', 'display_status']
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

@items_bp.route('/<int:item_id>', methods=['DELETE'])
@token_required
@role_required([1, 2])
def delete_item(item_id):
    db.execute_query(
        "UPDATE items SET deleted_status = 'Y', deleted_by = %s, deleted_time = NOW() WHERE item_id = %s",
        (request.user_id, item_id),
        commit=True
    )
    return jsonify({'message': 'Item deleted'}), 200