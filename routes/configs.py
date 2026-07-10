from flask import Blueprint, request, jsonify
from middleware import token_required, role_required
from db import db

configs_bp = Blueprint('configs', __name__, url_prefix='/api/configs')

@configs_bp.route('/', methods=['GET'])
@token_required
def get_configs():
    # Optionally filter by config_name
    config_name = request.args.get('name')
    if config_name:
        config = db.execute_one(
            "SELECT config_id, config_name, config_value, input_type FROM site_config WHERE config_name = %s AND deleted_status = 'N'",
            (config_name,)
        )
        return jsonify(config), 200
    else:
        configs = db.execute_query(
            "SELECT config_id, config_name, config_value, input_type FROM site_config WHERE deleted_status = 'N' ORDER BY config_id"
        )
        return jsonify(configs), 200

@configs_bp.route('/<int:config_id>', methods=['PUT'])
@token_required
@role_required([1, 2])  # Only dev/super admin can update configs
def update_config(config_id):
    data = request.get_json()
    if 'config_value' not in data:
        return jsonify({'message': 'config_value required'}), 400
    db.execute_query(
        "UPDATE site_config SET config_value = %s, updated_at = NOW() WHERE config_id = %s AND deleted_status = 'N'",
        (data['config_value'], config_id),
        commit=True
    )
    return jsonify({'message': 'Config updated'}), 200