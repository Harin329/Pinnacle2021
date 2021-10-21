import logging
import requests
from indexer.tools import init_conn, post_user, calculateSongs, get_userPlaylist, find_PlaylistMatch, set_anthem, find_match, get_allPlaylist
from indexer.user import get_allUser
from fastapi import FastAPI, APIRouter
from recommend.train import cosine_similarity
import random
import uvicorn
import pandas as pd
from sqlalchemy import create_engine
from starlette.middleware.cors import CORSMiddleware
from routes import admin, user
from routes.user import defaultUser

router = APIRouter()

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"])


@app.get('/')
def welcome():
    try:
        return "Welcome to Spotlight!", 200
    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400

app.include_router(admin.router)
app.include_router(user.router)

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

        userList = find_match(conn, cursor, userID)
        cursor.nextset()
        playlist = []

        # For Each User, Get Random Playlist
        for user in userList:
            print(user)
            try:
                res = get_userPlaylist(conn, cursor, user[3])
                print(res)
                cursor.nextset()
                playlist.append(random.choice(res))
                print(playlist)
            except:
                continue

        return playlist, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400

@app.get('/recommendByAlgo')
def recommend(userID: str = ""):
    try:
        conn, cursor = init_conn()

        playlist = find_PlaylistMatch(conn, cursor, userID)

        return playlist, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400

@app.get('/recommendUser')
def recommendUser(userID: str = ""):
    try:
        conn, cursor = init_conn()

        userList = find_match(conn, cursor, userID)

        return userList, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.get('/train')
def train():
    try:
        conn, cursor = init_conn()
        engine = create_engine(
            'mysql+mysqldb://user:root@pinnacle.harinwu.com:3306/spotlight_db', echo=True)

        res = get_allUser(cursor)
        cursor.nextset()
        playRes = get_allPlaylist(conn, cursor)

        df = pd.DataFrame({'user_id': [], 'reco_type': [], 'match_id': [], "match_score": []})

        print(playRes)

        if (res != None and len(res) > 0):
            for user in res:
                for user2 in res:
                    if (user[0] != user2[0]):
                        match = cosine_similarity(user[4:], user2[4:])
                        df.loc[len(df.index)] = [user[0], 'user', user2[0], match]

                if (playRes != None and len(playRes) > 0):
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
