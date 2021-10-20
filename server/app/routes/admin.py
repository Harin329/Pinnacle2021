from fastapi import APIRouter, responses
import logging
import time
import requests
from indexer.user import get_allUserId
from indexer.tools import init_conn
from routes.user import log_playlist


router = APIRouter(
    prefix="/admin",
    tags=["admin"],
    responses={404: {"description": "Not found"}},
)

expiry = None
token = None
refresh_token = "AQBsvG-fvAOIpbfqsmTTVtUtokKDLsC0CCKCZV9GIVBSRFyD2HdIkZ8RKDNZ3molAfMWMUS3tZSiF2jUaqqPkXY7NL3jFjSWk56wecWYzkI1CbEKl03XGs2aERgnRcVc2ho"
authorization = "Basic NGUyMWJmODYxN2QzNGYyOGE5Yjc2MmI1ZjI3ZmIwNDA6NTBjZTg2Mjk5MmUzNGExMzg0N2YwOTllOWIzMzBjYWY="

def obtainToken(code):
    token_url = 'https://accounts.spotify.com/api/token'
    headers = {'Authorization': authorization, 'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'}
    body = {'code': code, 'redirect_uri': "http://127.0.0.1:8000/admin/callback", 'grant_type': 'authorization_code'}
    post_response = requests.post(token_url, headers=headers, data=body)

    if post_response.status_code == 200:
        json = post_response.json()
        return json['access_token'], json['refresh_token'], json['expires_in']
    else:
        return None

def refreshToken():
    global refresh_token
    token_url = 'https://accounts.spotify.com/api/token'
    headers = {'Authorization': authorization, 'Accept': 'application/json', 'Content-Type': 'application/x-www-form-urlencoded'}
    body = {'refresh_token': refresh_token, 'grant_type': 'refresh_token'}
    post_response = requests.post(token_url, headers=headers, data=body)

    if post_response.status_code == 200:
        return post_response.json()['access_token'], post_response.json()['expires_in']
    else:
        return None

def getToken():
    global expiry
    global token
    global refresh_token
    if token == None or expiry == None or time.time() > expiry:
        payload = refreshToken()

        if payload != None:
            token = payload[0]
            expiry = time.time() + payload[1]

    return token


@router.get('/authorize')
def authorize():
    scopes = 'user-read-private streaming ugc-image-upload user-read-recently-played user-read-playback-state user-top-read playlist-modify-public user-modify-playback-state playlist-modify-private user-follow-modify user-read-currently-playing user-follow-read user-library-modify user-read-playback-position playlist-read-private user-read-email user-library-read playlist-read-collaborative'
    redirect_uri = 'http://127.0.0.1:8000/admin/callback'
    client_id = '4e21bf8617d34f28a9b762b5f27fb040'

    authorize_url = 'https://accounts.spotify.com/en/authorize?'
    parameters = 'response_type=code&client_id=' + client_id + '&redirect_uri=' + redirect_uri + '&scope=' + scopes
    response = responses.RedirectResponse(authorize_url + parameters)
    return response


@router.get('/callback')
def callback(code: str = ""):
    global expiry
    global token
    global refresh_token
    payload = obtainToken(code)
    if payload != None:
        token = payload[0]
        refresh_token = payload[1]
        expiry = time.time() + payload[2]
    else:
        return "Failed to access token"

    return "Auth Success, Refresh Token: " + refresh_token


@router.get("/checkToken")
def checkToken():
    global expiry
    global token
    global refresh_token
    try:
        checkedToken = getToken()
        return checkedToken, 200
    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@router.get("/refresh")
def refresh_all():
    global expiry
    global token
    global refresh_token
    try:
        _, cursor = init_conn()

        res = get_allUserId(cursor)
        
        for user in list(res):
            user = {
                "UserID": user[0],
                "UserName": "Harin",
                "Token": getToken()
            }
            numAdded = log_playlist(user)
            print("Total Added: " + str(len(numAdded)))

        return "Data Refreshed!", 200
    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400
