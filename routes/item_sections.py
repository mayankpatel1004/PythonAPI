from flask import Blueprint, request, jsonify
from middleware import token_required, role_required
from db import db

sections_bp = Blueprint('item_sections', __name__, url_prefix='/api/item-sections')

@sections_bp.route('/', methods=['GET'])
@token_required
def get_sections():
    sections = db.execute_query(
        "SELECT item_section_id, section_title, section_alias, item_type, description, "
        "display_status FROM item_section WHERE deleted_status = 'N' ORDER BY display_order"
    )
    return jsonify(sections), 200

@sections_bp.route('/', methods=['POST'])
@token_required
@role_required([1, 2])
def create_section():
    data = request.get_json()
    required = ['section_title', 'item_type']
    if not all(k in data for k in required):
        return jsonify({'message': 'Missing required fields'}), 400

    # Generate alias if not provided
    alias = data.get('section_alias') or data['section_title'].lower().replace(' ', '-')
    # Check duplicate alias? We'll allow.

    insert_id = db.execute_insert(
        """INSERT INTO item_section 
           (section_title, section_alias, item_type, description, meta_title, meta_description,
            display_order, display_status, created_by, created_by_name, created_by_role, created_at, updated_at)
           VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, NOW(), NOW())""",
        (
            data['section_title'],
            alias,
            data['item_type'],
            data.get('description', ''),
            data.get('meta_title', ''),
            data.get('meta_description', ''),
            data.get('display_order', 0),
            data.get('display_status', 'Y'),
            request.user_id,
            '',  # created_by_name could be fetched, but we skip
            request.role_id
        )
    )
    return jsonify({'id': insert_id, 'message': 'Section created'}), 201

@sections_bp.route('/<int:section_id>', methods=['PUT'])
@token_required
@role_required([1, 2])
def update_section(section_id):
    data = request.get_json()
    # Build update query dynamically
    allowed_fields = ['section_title', 'section_alias', 'item_type', 'description',
                      'meta_title', 'meta_description', 'display_order', 'display_status']
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

@sections_bp.route('/<int:section_id>', methods=['DELETE'])
@token_required
@role_required([1, 2])
def delete_section(section_id):
    # Soft delete
    db.execute_query(
        "UPDATE item_section SET deleted_status = 'Y', deleted_by = %s, deleted_time = NOW() WHERE item_section_id = %s",
        (request.user_id, section_id),
        commit=True
    )
    return jsonify({'message': 'Section deleted'}), 200