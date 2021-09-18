FROM mysql:latest

COPY ./sproc/* /docker-entrypoint-initdb.d/
COPY ./tables/* /docker-entrypoint-initdb.d/