import logging
import requests
from indexer.tools import connect_mysql, post_user, get_health, post_playlist, find_PlaylistMatch, set_anthem, get_allUser, create_match, find_match, get_allPlaylist
from fastapi import FastAPI
from recommend.train import cosine_similarity
import uvicorn
import time
import pandas as pd
from sqlalchemy import create_engine
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
        token = user['Token']

        url = "https://api.spotify.com/v1/me/playlists?limit=50"
        headers = {"Authorization": "Bearer {}".format(token)}
        response = requests.get(url, headers=headers, params={})
        res = response.json()

        added = []

        for p in res['items']:
            playlistID = p["id"]
            playlistName = p["name"]

            url_track = "https://api.spotify.com/v1/playlists/" + playlistID + \
                "/tracks?fields=items(track(name%2Chref%2Calbum(name%2Chref)%2Cid))&limit=100&offset=0"
            headers_track = {"Authorization": "Bearer {}".format(token)}
            response_track = requests.get(
                url_track, headers=headers_track, params={})
            res_track = response_track.json()

            url_track2 = "https://api.spotify.com/v1/playlists/" + playlistID
            response_track2 = requests.get(
                url_track2, headers=headers_track, params={})
            res_track2 = response_track2.json()
            followers = res_track2["followers"]["total"]

            songlist = []
            tracks = res_track['items']

            for song in tracks:
                s = song['track']['id']
                songlist.append(s)

            metrics = calculateSongs(token, songlist)
            res = post_playlist(conn, cursor, playlistID,
                                playlistName, userID, followers, metrics)
            added.append(res)
        return added, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.post('/getTop')
def get_top(user: dict = defaultUser):
    try:
        conn, cursor = init_conn()
        userID = user['UserID']
        userName = user['UserName']
        token = user['Token']

        url = "https://api.spotify.com/v1/me/top/tracks?time_range=long_term&limit=3"
        headers = {"Authorization": "Bearer {}".format(token)}
        response = requests.get(url, headers=headers, params={})
        res = response.json()

        return res, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.post('/getTopArtists')
def get_top(user: dict = defaultUser):
    try:
        conn, cursor = init_conn()
        userID = user['UserID']
        userName = user['UserName']
        token = user['Token']

        url = "https://api.spotify.com/v1/me/top/artists?time_range=long_term&limit=12"
        headers = {"Authorization": "Bearer {}".format(token)}
        response = requests.get(url, headers=headers, params={})
        res = response.json()

        return res, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.put('/setAnthem')
def log_anthem(userID: str = "", anthem: str = ""):
    try:
        conn, cursor = init_conn()

        res = set_anthem(conn, cursor, userID, anthem)

        return res, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.get('/recommendByUser')
def recommend(userID: str = ""):
    try:
        conn, cursor = init_conn()

        userList = find_match(userID)
        playlist = []

        # For Each User, Get Random Playlist
        for user in userList:
            res = get_userPlaylist(conn, cursor, user[0])
            playlist.append(random.choice(res))

        return playlist, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400

@app.get('/recommendByAlgo')
def recommend(userID: str = ""):
    try:
        conn, cursor = init_conn()

        playlist = find_PlaylistMatch(userID)

        return playlist, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400

@app.get('/recommendUser')
def recommendUser(userID: str = ""):
    try:
        conn, cursor = init_conn()

        userList = find_match(userID)

        return userList, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.get('/train')
def train():
    try:
        conn, cursor = init_conn()
        engine = create_engine(
            'mysql+mysqldb://user:root@34.134.241.78:3306/spotlight_db', echo=True)

        res = get_allUser(conn, cursor)
        playRes = get_allPlaylist(conn, cursor)

        df = pd.DataFrame({'user_id': [], 'reco_type': [], 'match_id': [], "match_score": []})

        for user in res:
            for user2 in res:
                if (user[0] != user2[0]):
                    match = cosine_similarity(user[4:], user2[4:])
                    df.loc[len(df.index)] = [user[0], 'user', user2[0], match]

            for play in playRes:
                match = cosine_similarity(user[4:], play[5:])
                df.loc[len(df.index)] = [user[0], 'playlist', play[0], match]

        df.to_sql(con=engine, name='recommend_table', if_exists='replace')
        engine.dispose()

        return res, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


if __name__ == '__main__':
    uvicorn.run(app=app, host='127.0.0.1', port=8000)
