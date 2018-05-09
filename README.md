# webBudget Docker Image 

The webBudget docker image repository.

## Using the image:

#### To run

```
docker run --name webbudget -itd -p 8443:8443 arthurgregorio/web-budget-docker
```

#### To see the logs 

```
docker logs -f webbudget
```

#### To control the lifecycle

```
docker start/stop/restart webbudget
```
