import json
import firebase_admin
from firebase_admin import credentials, auth
from config import Config
# Load Firebase service account key (Download from Firebase Console)
firebase_dict = json.loads(Config.FIREBASE_CONFIG)
cred = credentials.Certificate(firebase_dict)
firebase_admin.initialize_app(cred)

def verify_firebase_token(token):
    try:
        decoded_token = auth.verify_id_token(token)
        return decoded_token
    except Exception as e:
        return None
