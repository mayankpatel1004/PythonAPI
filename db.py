import mysql.connector
from mysql.connector import Error
from config import Config

class Database:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
            cls._instance._initialize()
        return cls._instance

    def _initialize(self):
        self.connection = None
        try:
            self.connection = mysql.connector.connect(
                host=Config.DB_HOST,
                user=Config.DB_USER,
                password=Config.DB_PASSWORD,
                database=Config.DB_NAME
            )
            self.connection.autocommit = False
        except Error as e:
            print(f"Database connection failed: {e}")
            raise

    def get_cursor(self):
        if not self.connection or not self.connection.is_connected():
            self._initialize()
        return self.connection.cursor(dictionary=True)

    def execute_query(self, query, params=None, commit=False):
        cursor = self.get_cursor()
        try:
            cursor.execute(query, params or ())
            if commit:
                self.connection.commit()
            result = cursor.fetchall()
            return result
        except Error as e:
            self.connection.rollback()
            raise e
        finally:
            cursor.close()

    def execute_one(self, query, params=None, commit=False):
        cursor = self.get_cursor()
        try:
            cursor.execute(query, params or ())
            if commit:
                self.connection.commit()
            result = cursor.fetchone()
            return result
        except Error as e:
            self.connection.rollback()
            raise e
        finally:
            cursor.close()

    def execute_insert(self, query, params=None):
        cursor = self.get_cursor()
        try:
            cursor.execute(query, params or ())
            self.connection.commit()
            return cursor.lastrowid
        except Error as e:
            self.connection.rollback()
            raise e
        finally:
            cursor.close()

db = Database()