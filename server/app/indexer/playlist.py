import logging

def refresh_playlists(conn, cursor):
    sql = 'getHealth'
    try:
        cursor.callproc(sql)
        return cursor.fetchall()
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)