import logging

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