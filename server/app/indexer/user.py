import logging

def get_allUser(cursor):
    sql = 'getAllUser'
    try:
        cursor.callproc(sql)
        return cursor.fetchall()
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)

def get_allUserId(cursor):
    sql = 'getAllUserId'
    try:
        cursor.callproc(sql)
        return cursor.fetchall()
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)