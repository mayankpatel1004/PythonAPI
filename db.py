import mysql.connector
from mysql.connector import Error
from config import Config
from utils.logger import sql_logger   # import the logger

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
            sql_logger.error(f"Database connection failed: {e}")
            raise

    def _log_query(self, query, params=None):
        """Log the SQL query with parameters to the file."""
        if Config.DEBUG:
            if params:
                # Format parameters for readability (optional)
                formatted_query = query
                for p in params:
                    if isinstance(p, str):
                        formatted_query = formatted_query.replace('%s', f"'{p}'", 1)
                    else:
                        formatted_query = formatted_query.replace('%s', str(p), 1)
                sql_logger.debug(formatted_query)
            else:
                sql_logger.debug(query)

    def get_cursor(self):
        if not self.connection or not self.connection.is_connected():
            self._initialize()
        return self.connection.cursor(dictionary=True)

    def execute_query(self, query, params=None, commit=False):
        self._log_query(query, params)
        cursor = self.get_cursor()
        try:
            cursor.execute(query, params or ())
            if commit:
                self.connection.commit()
            result = cursor.fetchall()
            return result
        except Error as e:
            self.connection.rollback()
            sql_logger.error(f"Query failed: {e}")
            raise e
        finally:
            cursor.close()

    def execute_one(self, query, params=None, commit=False):
        self._log_query(query, params)
        cursor = self.get_cursor()
        try:
            cursor.execute(query, params or ())
            if commit:
                self.connection.commit()
            result = cursor.fetchone()
            return result
        except Error as e:
            self.connection.rollback()
            sql_logger.error(f"Query failed: {e}")
            raise e
        finally:
            cursor.close()

    def execute_insert(self, query, params=None):
        self._log_query(query, params)
        cursor = self.get_cursor()
        try:
            cursor.execute(query, params or ())
            self.connection.commit()
            return cursor.lastrowid
        except Error as e:
            self.connection.rollback()
            sql_logger.error(f"Insert failed: {e}")
            raise e
        finally:
            cursor.close()

    def execute_transaction(self, queries):
        """Execute multiple queries in a single transaction."""
        if Config.DEBUG:
            sql_logger.debug("=== TRANSACTION START ===")
            for q, p in queries:
                self._log_query(q, p)
            sql_logger.debug("=== TRANSACTION END ===")

        cursor = self.get_cursor()
        try:
            for query, params in queries:
                cursor.execute(query, params)
            self.connection.commit()
        except Exception as e:
            self.connection.rollback()
            sql_logger.error(f"Transaction failed: {e}")
            raise e
        finally:
            cursor.close()

db = Database()