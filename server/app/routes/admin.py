from fastapi import APIRouter
import logging
from indexer.user import get_allUserId
from indexer.tools import init_conn
from routes.user import log_playlist


router = APIRouter(
    prefix="/admin",
    tags=["admin"],
    responses={404: {"description": "Not found"}},
)


@router.get("/refresh")
def refresh_all():
    try:
        _, cursor = init_conn()

        res = get_allUserId(cursor)
        
        for user in list(res):
            user = {
                "UserID": user,
                "UserName": "Harin",
                "Token": "BQBSzpiYIvCUDtECgaXrf4xIICjS5uTGlHfcEeKAsxyRyl3iW--tbYUkqw7KanTbg6Qvvxlz_Mm4IinFuRTc2e8BGeaHd_f2689c6gNCw2DhUM8OlKOReYQm59HpI2EINwD5cGjUUnndhS5Wm_AoDqWVRrqwWVfJTvUkNO9BaCCDJnJufesJFGp2BY6uNufj7ZQ"
            }
            log_playlist(user)

        return "Data Refreshed!", 200
    except Exception as e:
        logging.error(e)
        return "Error with {}".format(e), 400
