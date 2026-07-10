import os
from flask import Blueprint, request, jsonify
from middleware import token_required, role_required
from db import db
from utils.file_upload import save_uploaded_file

sections_bp = Blueprint('item_sections', __name__, url_prefix='/api/item-sections')

# ------------------- GET all sections (list) -------------------
@sections_bp.route('/', methods=['GET'])
@token_required
def get_sections():
    sections = db.execute_query(
        """SELECT item_section_id, section_title, section_alias, item_type,
                  description, attachment1, meta_title, meta_description,
                  display_order, display_status, created_at, updated_at
           FROM item_section
           WHERE deleted_status = 'N'
           ORDER BY display_order"""
    )
    return jsonify(sections), 200

# ------------------- GET a single section -------------------
@sections_bp.route('/<int:section_id>', methods=['GET'])
@token_required
def get_section(section_id):
    section = db.execute_one(
        """SELECT item_section_id, section_title, section_alias, item_type,
                  description, attachment1, meta_title, meta_description,
                  display_order, display_status, created_at, updated_at
           FROM item_section
           WHERE item_section_id = %s AND deleted_status = 'N'""",
        (section_id,)
    )
    if not section:
        return jsonify({'message': 'Section not found'}), 404
    return jsonify(section), 200

# ------------------- CREATE a new section (JSON + multipart) -------------------
@sections_bp.route('/', methods=['POST'])
@token_required
@role_required([1, 2])
def create_section():
    # Determine request type
    if request.content_type and 'multipart/form-data' in request.content_type:
        data = request.form.to_dict()
        # Handle file upload
        attachment1 = save_uploaded_file(request.files.get('attachment1'))
        if attachment1:
            data['attachment1'] = attachment1
    else:
        data = request.get_json()
        if not data:
            return jsonify({'message': 'Invalid JSON or form-data'}), 400

    # Validate required fields
    required = ['section_title', 'item_type']
    if not all(k in data for k in required):
        return jsonify({'message': 'Missing required fields: section_title, item_type'}), 400

    # Generate alias if not provided
    alias = data.get('section_alias')
    if not alias:
        alias = data['section_title'].lower().replace(' ', '-').replace('&', 'and')

    parent_id = data.get('item_section_parent_id', 0)

    insert_id = db.execute_insert(
        """INSERT INTO item_section
           (site_id, item_section_parent_id, section_title, section_alias,
            item_type, description, attachment1, user_id, meta_title,
            meta_description, display_order, display_status,
            created_by, created_by_name, created_by_role, created_at, updated_at)
           VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, NOW(), NOW())""",
        (
            0,  # site_id default
            parent_id,
            data['section_title'],
            alias,
            data['item_type'],
            data.get('description', ''),
            data.get('attachment1'),
            0,  # user_id default
            data.get('meta_title', ''),
            data.get('meta_description', ''),
            data.get('display_order', 0),
            data.get('display_status', 'Y'),
            request.user_id,
            '',  # created_by_name
            request.role_id
        )
    )
    return jsonify({'id': insert_id, 'message': 'Section created'}), 201

# ------------------- UPDATE an existing section (JSON + multipart) -------------------
@sections_bp.route('/<int:section_id>', methods=['PUT'])
@token_required
@role_required([1, 2])
def update_section(section_id):
    # Check if section exists
    existing = db.execute_one(
        "SELECT item_section_id FROM item_section WHERE item_section_id = %s AND deleted_status = 'N'",
        (section_id,)
    )
    if not existing:
        return jsonify({'message': 'Section not found'}), 404

    # Determine request type
    if request.content_type and 'multipart/form-data' in request.content_type:
        data = request.form.to_dict()
        # Handle file upload – if new file, save and replace
        attachment1 = save_uploaded_file(request.files.get('attachment1'))
        if attachment1:
            data['attachment1'] = attachment1
    else:
        data = request.get_json()
        if not data:
            return jsonify({'message': 'Invalid JSON or form-data'}), 400

    # Allowed fields to update
    allowed_fields = [
        'section_title', 'section_alias', 'item_type', 'description',
        'attachment1', 'meta_title', 'meta_description', 'display_order',
        'display_status', 'item_section_parent_id'
    ]
    updates = []
    values = []
    for field in allowed_fields:
        if field in data:
            updates.append(f"{field} = %s")
            values.append(data[field])

    if not updates:
        return jsonify({'message': 'No fields to update'}), 400

    values.append(section_id)
    query = f"UPDATE item_section SET {', '.join(updates)}, updated_at = NOW() WHERE item_section_id = %s AND deleted_status = 'N'"
    db.execute_query(query, values, commit=True)
    return jsonify({'message': 'Section updated'}), 200

# ------------------- DELETE a section (soft delete) -------------------
@sections_bp.route('/<int:section_id>', methods=['DELETE'])
@token_required
@role_required([1, 2])
def delete_section(section_id):
    existing = db.execute_one(
        "SELECT item_section_id FROM item_section WHERE item_section_id = %s AND deleted_status = 'N'",
        (section_id,)
    )
    if not existing:
        return jsonify({'message': 'Section not found'}), 404

    db.execute_query(
        """UPDATE item_section
           SET deleted_status = 'Y', deleted_by = %s, deleted_time = NOW()
           WHERE item_section_id = %s""",
        (request.user_id, section_id),
        commit=True
    )
    return jsonify({'message': 'Section deleted'}), 200