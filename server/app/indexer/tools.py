import logging
from common.config import MYSQL_HOST, MYSQL_PORT, MYSQL_USER, MYSQL_PWD, MYSQL_DB
import MySQLdb


def connect_mysql():
    try:
        conn = MySQLdb.connect(host=MYSQL_HOST,user=MYSQL_USER,port=MYSQL_PORT,password=MYSQL_PWD,database=MYSQL_DB, local_infile=True)
        return conn
    except Exception as e:
        print("MYSQL ERROR: connect failed")
        logging.error(e)


def post_user(conn, cursor, userID, userName, metrics):
    sql = 'postUser'
    try:
        cursor.callproc(sql, (
            userID,
            userName, 
            metrics['danceability'], 
            metrics['energy'], 
            metrics['key'], 
            metrics['loudness'],
            metrics['mode'], 
            metrics['speechiness'], 
            metrics['acousticness'], 
            metrics['instrumentalness'],
            metrics['liveness'], 
            metrics['valence'],
            metrics['tempo']
             ))
        conn.commit()
        return name
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)

def get_health(conn, cursor):
    sql = 'getHealth'
    try:
        cursor.callproc(sql)
        return cursor.fetchall()
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)