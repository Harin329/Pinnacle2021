import logging
import requests
from indexer.tools import connect_mysql, post_user, get_health
from fastapi import FastAPI
import uvicorn
from starlette.requests import Request
from starlette.middleware.cors import CORSMiddleware

defaultUser = {
    "UserID": "123",
    "UserName": "Harin"
}

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"])


def init_conn():
    conn = connect_mysql()
    cursor = conn.cursor()
    return conn, cursor


def calculateSongs(songs: list = []):
    metric = {}
    for s in songs:
        print(s)  # Calculate
    return metric


@app.get('/')
def welcome():
    try:
        return "Welcome to Spotlight!", 200
    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.post('/logUser')
def log_user(user: dict = defaultUser):
    try:
        conn, cursor = init_conn()
        userID = user['UserID']
        userName = user['UserName']

        savedTracks = []  # Get Saved Tracks

        metrics = calculateSongs(savedTracks)
        res = post_user(conn, cursor, userID, userName, metrics)
        return res, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.post('/logPlaylist')
def log_playlist(user: dict = defaultUser):
    try:
        conn, cursor = init_conn()
        userID = user['UserID']
        userName = user['UserName']
        publicPlaylists = []  # Get All Playlists

        for p in publicPlaylists:
            playlistID = ""
            playlistName = ""
            songlist = []  # Get Songs in Playlist
            metrics = calculateSongs(songlist)
            res = post_playlist(conn, cursor, playlistID,
                                playlistName, metrics)
        return res, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


if __name__ == '__main__':
    uvicorn.run(app=app, host='127.0.0.1', port=8000)
