from flask import Blueprint, request, jsonify
from app.services.firebase_service import verify_firebase_token
from app.services.db_service import get_user_by_google_id, create_user

auth_bp = Blueprint("auth", __name__)

@auth_bp.route("/google", methods=["POST"])
def google_auth():
    token = request.json.get("token")
    
    decoded_token = verify_firebase_token(token)
    if not decoded_token:
        return jsonify({"error": "Invalid token"}), 401

    uid = decoded_token["uid"]
    name = decoded_token.get("name")
    email = decoded_token.get("email")
    picture = decoded_token.get("picture")

    user = get_user_by_google_id(uid)

    if not user:
        user = create_user(uid, name, email, picture)

    return jsonify({"user": user}), 200
