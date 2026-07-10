import bcrypt

plain = "abc#123"
hashed = bcrypt.hashpw(plain.encode('utf-8'), bcrypt.gensalt()).decode('utf-8')
print(hashed)