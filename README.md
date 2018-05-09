# webBudget Docker Image 

The webBudget docker image repository.

## Using the image:

#### To run

```
docker run --name webbudget -itd -p 8443:8443 arthurgregorio/web-budget-docker
```

And after that, in your prefered browser open the following URL: https://localhost:8443 and use the username as admin and password as admin.

#### To see the logs 

```
docker logs -f webbudget
```

#### To control the lifecycle

```
docker start/stop/restart webbudget
```

#### References

This image was made using by reference other two images, one from [Arun Gupta](https://github.com/arun-gupta/docker-images/tree/master/wildfly-mysql-javaee7) and the other from [kaiwinter](https://github.com/kaiwinter/wildfly10-mariadb). Thanks for sharing!
