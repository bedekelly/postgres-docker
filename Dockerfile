FROM postgres
ENV POSTGRES_DB hub
COPY sql/*.sql sql/*.sql.gz /docker-entrypoint-initdb.d/
COPY scripts/*.sh /docker-entrypoint-initdb.d/
