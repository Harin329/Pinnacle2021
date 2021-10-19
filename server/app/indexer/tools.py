import logging
from common.config import MYSQL_HOST, MYSQL_PORT, MYSQL_USER, MYSQL_PWD, MYSQL_DB
import MySQLdb
import requests
import spotipy
from spotipy.oauth2 import SpotifyClientCredentials

sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id="4e21bf8617d34f28a9b762b5f27fb040", client_secret="50ce862992e34a13847f099e9b330caf"))

def connect_mysql():
    try:
        conn = MySQLdb.connect(host=MYSQL_HOST,user=MYSQL_USER,port=MYSQL_PORT,password=MYSQL_PWD,database=MYSQL_DB, local_infile=True)
        return conn
    except Exception as e:
        print("MYSQL ERROR: connect failed")
        logging.error(e)


def init_conn():
    conn = connect_mysql()
    cursor = conn.cursor()
    return conn, cursor


def calculateSongs(token: str = "", songs: list = []):
    metric = {"danceability": 0, "energy": 0, "key": 0, "loudness": 0, "mode": 0, "speechiness": 0,
              "acousticness": 0, "instrumentalness": 0, "liveness": 0, "valence": 0, "tempo": 0, }

    if (len(songs) == 0):
        print("Empty List")
        return metric

    url = "https://api.spotify.com/v1/audio-features"
    headers = {"Authorization": "Bearer {}".format(token)}
    joined = ",".join(songs)
    response = requests.get(url, headers=headers, params={
                            "ids": joined})
    res = response.json()
    total = len(res['audio_features'])
    for r in res['audio_features']:
        metric["danceability"] += r["danceability"]
        metric["energy"] += r["energy"]
        metric["key"] += r["key"]
        metric["loudness"] += r["loudness"]
        metric["mode"] += r["mode"]
        metric["speechiness"] += r["speechiness"]
        metric["acousticness"] += r["acousticness"]
        metric["instrumentalness"] += r["instrumentalness"]
        metric["liveness"] += r["liveness"]
        metric["valence"] += r["valence"]
        metric["tempo"] += r["tempo"]
    metric["danceability"] /= total
    metric["energy"] /= total
    metric["key"] /= total
    metric["loudness"] /= total
    metric["mode"] /= total
    metric["speechiness"] /= total
    metric["acousticness"] /= total
    metric["instrumentalness"] /= total
    metric["liveness"] /= total
    metric["valence"] /= total
    metric["tempo"] /= total
    return metric


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
        return metrics
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)

def post_playlist(conn, cursor, playlistID, playlistName, creator, followers, metrics):
    sql = 'postPlaylist'
    try:
        cursor.callproc(sql, (
            playlistID,
            playlistName, 
            creator,
            followers,
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
        return metrics
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

def set_anthem(conn, cursor, userID, anthem):
    sql = 'setAnthem'
    try:
        cursor.callproc(sql, (userID, anthem, ))
        conn.commit()
        return anthem
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)

def get_allPlaylist(conn, cursor):
    sql = 'getAllPlaylist'
    try:
        cursor.callproc(sql)
        return cursor.fetchall()
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)

def create_match(conn, cursor, userID, matchID, match):
    sql = 'postRecommendation'
    try:
        cursor.callproc(sql, (userID, matchID, match, ))
        conn.commit()
        return match
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)

def find_match(conn, cursor, userID):
    sql = 'getMatches'
    try:
        cursor.callproc(sql, (userID, ))
        return cursor.fetchall()
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)

def find_PlaylistMatch(conn, cursor, userID):
    sql = 'getPlaylists'
    try:
        cursor.callproc(sql, (userID, ))
        return cursor.fetchall()
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)

def get_userPlaylist(conn, cursor, userID):
    sql = 'getUserPlaylist'
    try:
        cursor.callproc(sql, (userID, ))
        return cursor.fetchall()
    except Exception as e:
        print("MYSQL ERROR:", sql)
        logging.error(e)