from fastapi import APIRouter
import logging
import requests
from indexer.tools import init_conn, calculateSongs
from indexer.playlist import post_playlist


router = APIRouter(
    prefix="/user",
    tags=["user"],
    responses={404: {"description": "Not found"}},
)

defaultUser = {
    "UserID": "123",
    "UserName": "Harin",
    "Token": "abc"
}

@router.post('/myPlaylist')
def log_playlist(user: dict = defaultUser):
    try:
        conn, cursor = init_conn()
        userID = user['UserID']
        # userName = user['UserName']
        token = user['Token']

        url = "https://api.spotify.com/v1/me/playlists?limit=50"
        headers = {"Authorization": "Bearer {}".format(token)}
        response = requests.get(url, headers=headers, params={})
        res = response.json()

        added = []

        for p in res['items']:
            try:
                playlistID = p["id"]
                playlistName = p["name"]
                print(playlistName)

                if (p["owner"]["display_name"] == "Spotify" or not p["public"]):
                    continue

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
            except:
                print("error training - skipping")
        return added, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@router.post('/playlist')
def log_playlist(user: dict = defaultUser):
    try:
        conn, cursor = init_conn()
        userID = user['UserID']
        # userName = user['UserName']
        token = user['Token']

        url = "https://api.spotify.com/v1/" + userID + "/playlists?limit=50"

        next = url

        while (next != None):
            headers = {"Authorization": "Bearer {}".format(token)}
            response = requests.get(next, headers=headers, params={})
            res = response.json()

            added = []

            next = res['next']

            for p in res['items']:
                try:
                    playlistID = p["id"]
                    playlistName = p["name"]
                    print(playlistName)

                    if (p["owner"]["display_name"] == "Spotify" or not p["public"]):
                        continue

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
                except:
                    print("error training - skipping")
        return added, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400