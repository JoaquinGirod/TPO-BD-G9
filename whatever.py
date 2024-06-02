import pymysql
import psycopg2
import sqlite3

def check_mysql_connection(host, user, password, database):
    try:
        connection = pymysql.connect(host=host,
                                     user=user,
                                     password=password,
                                     database=database)
        with connection.cursor() as cursor:
            cursor.execute("SELECT VERSION()")
            result = cursor.fetchone()
            print(f"MySQL Database version: {result[0]}")
        connection.close()
        print("MySQL connection is working correctly.")
    except Exception as e:
        print(f"Failed to connect to MySQL: {e}")

def check_postgresql_connection(host, user, password, database):
    try:
        connection = psycopg2.connect(host=host,
                                      user=user,
                                      password=password,
                                      dbname=database)
        cursor = connection.cursor()
        cursor.execute("SELECT version()")
        result = cursor.fetchone()
        print(f"PostgreSQL Database version: {result[0]}")
        connection.close()
        print("PostgreSQL connection is working correctly.")
    except Exception as e:
        print(f"Failed to connect to PostgreSQL: {e}")

def check_sqlite_connection(database):
    try:
        connection = sqlite3.connect(database)
        cursor = connection.cursor()
        cursor.execute("SELECT sqlite_version()")
        result = cursor.fetchone()
        print(f"SQLite Database version: {result[0]}")
        connection.close()
        print("SQLite connection is working correctly.")
    except Exception as e:
        print(f"Failed to connect to SQLite: {e}")

if __name__ == "__main__":
    # MySQL connection parameters
    mysql_host = 'localhost'
    mysql_user = 'root'
    mysql_password = 'password'
    mysql_database = 'test_db'

    # PostgreSQL connection parameters
    postgresql_host = 'localhost'
    postgresql_user = 'postgres'
    postgresql_password = 'password'
    postgresql_database = 'test_db'

    # SQLite connection parameters
    sqlite_database = 'test_db.sqlite'

    # Check connections
    check_mysql_connection(mysql_host, mysql_user, mysql_password, mysql_database)
    check_postgresql_connection(postgresql_host, postgresql_user, postgresql_password, postgresql_database)
    check_sqlite_connection(sqlite_database)
