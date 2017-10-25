# PostgreSQL + Docker Quickstart

This is a quick example of how to setup PostgreSQL inside a Docker container.

It builds on the Docker Hub official Postgres image by copying bash scripts and SQL files into a folder on the running container. These scripts are executed in lexicographical (1-9, A-Z) order.

As an example, `sql/1-schema.sql` creates a simple relation of `HubUser`s. Then, `sql/2-initial_data.sql` populates it with a row of data. Finally, `scripts/3-hello.sh` runs and echoes a message.

To build the image:

```
docker build . -t hubusers
```

To run the image in the background:

```
docker logs -f `docker run -d -p5432:5432 hubusers`
```

*(N.B. it's safe to press Ctrl+C to exit without killing the database.)*

To connect to the database locally:

```
psql -hlocalhost -Upostgres -dhub
```

Here, `hub` is the name of the database; this is set in the Dockerfile on line 4 by the environment variable `POSTGRES_DB`. `postgres` is the default user, which doesn't require authentication, but it'd also be possible to create a new user to access the database.