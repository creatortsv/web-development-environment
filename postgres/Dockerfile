ARG POSTGRES_VERSION

FROM postgres:$POSTGRES_VERSION

COPY ./entrypoint.sh /docker-entrypoint-initdb.d/entrypoint.sh
RUN chown postgres:postgres /docker-entrypoint-initdb.d/entrypoint.sh