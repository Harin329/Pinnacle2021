import logging
from indexer.tools import connect_mysql, post_health, get_health
from fastapi import FastAPI
import uvicorn
from starlette.requests import Request
from starlette.middleware.cors import CORSMiddleware

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


@app.get('/')
def welcome():
    try:
        return "Hello Harin!", 200
    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.post('/logHealth')
def log_health(name: str="Hao"):
    try:
        conn, cursor = init_conn()
        res = post_health(conn, cursor, name)
        return res, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


@app.get('/lastHealth')
def log_health():
    try:
        conn, cursor = init_conn()
        res = get_health(conn, cursor)
        return res, 200

    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400


if __name__ == '__main__':
    uvicorn.run(app=app, host='127.0.0.1', port=8000)