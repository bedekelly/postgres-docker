FROM postgres
ENV POSTGRES_DB hub
COPY sql/*.sql /docker-entrypoint-initdb.d/
COPY scripts/*.sh /docker-entrypoint-initdb.d/
