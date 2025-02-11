from app import mongo

def get_user_by_google_id(google_id):
    return mongo.db.users.find_one({"googleId": google_id})

def create_user(google_id, name, email, picture):
    user = {
        "googleId": google_id,
        "name": name,
        "email": email,
        "picture": picture
    }
    mongo.db.users.insert_one(user)
    return user
