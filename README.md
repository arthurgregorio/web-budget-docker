# webBudget Docker Image 

The webBudget docker image repository.

## Using the image:

Since version 3, the application didn't come with the database embedded inside de container. Instead, we provide a new way to run the
application + database using [Docker Compose](https://docs.docker.com/compose/).

All said, there a are now two ways to run the application:

1. Standalone, using a local (or docker container) installation of Postgres
2. With application and database together with docker compose

### Option #1

If you have a Postgres instance in your network or running on another docker container, you can skip the process of using compose and 
use just the webBudget container. This approach is suitable for production environments.

To do that, use the command below:

```
docker run --name webbudget -itd -e DB_HOST=my-pg-host -e DB_USER=my-db-user -e DB_PASS=my-db-pass -p 8443:8443 arthurgregorio/web-budget-docker
```

If you have to specify the database server port or database name, the environment variables are:

- **DB_PORT** (default: 5432)
- **DB_NAME** (default: webbudget)

### Option #2

If you prefer an easier way to run the application, use compose. It will configure everything for you.

To do that, download the file [*docker-compose.yml*](https://github.com/arthurgregorio/web-budget-docker/blob/master/docker-compose.yml) and on the directory where the was saved, run the command below:

```
docker-compose up -d
```

Two images will be created:

- **webbudget_app**: the application itself
- **webbudget_db**: the application database

If you want to configure something, like the names and passwords used, just change on the compose file and run it again.

### FAQ

Which URL should I use to acess the application? 

> https://localhost:8443, the default user and password are "admin"

May I use this on a production environment? 

> Yes, in this case I recommend to use the option #1 and not the compose installation because you might prefer more control over the application data

### Helpful informations

To see the application logs, use:

```
docker logs -f (container name)
```

To control the lifecycle, use:

```
docker start/stop/restart (container name)
```

If you are using the compose version, use the same commands above but instead of using *docker* use *docker-compose* and remove the container name.

> QUICK NOTE! 
> Everytime you will use compose, you should be in the same directory of the docker-compose.yml downloaded at option #2

Default container names:

- standalone (option #1): *webbudget* (see *--name* parameter)
- with compose (option #2): application name *webbudget_app*, database name *webbudget_db* 