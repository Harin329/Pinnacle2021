import logging
import requests
from indexer.tools import connect_mysql, post_user, get_health
from fastapi import FastAPI
import uvicorn
from starlette.requests import Request
from starlette.middleware.cors import CORSMiddleware

defaultUser = {
    "UserID": "123",
    "UserName": "Harin",
    "token": "abc"
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


def calculateSongs(token: str = "", songs: list = []):
    metric = {"danceability": 0, "energy": 0, "key": 0, "loudness": 0, "mode": 0, "speechiness": 0,
              "acousticness": 0, "instrumentalness": 0, "liveness": 0, "valence": 0, "tempo": 0, }
    url = "https://api.spotify.com/v1/audio-features"
    headers = {"Authorization": "Bearer {}".format(token)}
    response = requests.get(url, headers=headers, params={
                            "ids": ",".join(songs)})
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


@app.get('/')
def welcome():
    try:
        return "Welcome to Spotlight!", 200
    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.get('/testSpotify')
def testSpotify(token: str = ""):
    try:
        url = "https://api.spotify.com/v1/audio-features"
        headers = {"Authorization": "Bearer {}".format(token)}
        response = requests.get(url, headers=headers, params={
                                "ids": "06PBQ4rDmHRVfWsszDwLTa,06PBQ4rDmHRVfWsszDwLTa"})
        return response.json()
    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.post('/logUser')
def log_user(user: dict = defaultUser):
    try:
        conn, cursor = init_conn()
        userID = user['UserID']
        userName = user['UserName']
        token = user['Token']

        url = "https://api.spotify.com/v1/me/tracks"
        headers = {"Authorization": "Bearer {}".format(token)}
        response = requests.get(url, headers=headers, params={})
        res = response.json()

        items = res['items']
        for i in items:
            id = i['track']['id']
            savedTracks = []
            savedTracks.append(id)

        metrics = calculateSongs(token, savedTracks)
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
