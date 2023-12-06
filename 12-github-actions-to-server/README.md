# Migrate GitHub Actions configuration to use Internship server

## Task

Task: Migrate GitHub Actions configuration to use Internship server 

## Solution

The server currently uses a cloned repository, while starting the containers using 'docker-compose up' command has to be done manually. This causes an issue because it's not practical to repeatedly SSH into server, clone the repository for every change in the app code and then start 'docker-compose up' each time. We need to automate this process so that whenever there's a new push to the GitHub repository, the container versions get updated automatically.

Deploying a GitHub Actions self-hosted runner onto our internship server will automate the process of updating the Docker containers. Access the server via SSH and follow the provided commands to add this runner. Here are the steps to add a self-hosted runner: `(Repo's) Settings -> Actions -> Runners -> New self-hosted runner -> Choose Runner image and architecture -> Execute commands for download -> Execute commands for configure -> Use your self-hosted runner in a YAML workflow file`.

We need to implement specific modification within the [`merge.yml`](/.github/workflows/merge.yml) file. Within the `docker-compose` job, incorporate the `--build` option into the command: `docker compose -f ./00-spring-petclinic-deployment/docker-compose.yml up -d`. The `--build` option is used to build or rebuild the services defined in a `docker-compose.yml` file. It ensures that any changes made to the Dockerfiles or build context of the services are applied when the containers are created. By doing so, we utilize the latest code version while keeping other containers unchanged if they haven't been altered.

```yml
docker compose -f ./00-spring-petclinic-deployment/docker-compose.yml up -d --build
```

Verify that the container is using the new image by verifying that the `SHA256` hash of the new image matches the `SHA256` hash of image being used by the container:
```bash
$ docker images
REPOSITORY                                TAG         IMAGE ID       CREATED         SIZE
adinpilavdzija/spring-petclinic-angular   latest      9e8d0a9a034a   4 minutes ago   60.4MB

$ docker ps
CONTAINER ID   IMAGE                                            COMMAND                  CREATED          STATUS          PORTS                    NAMES
5341f1dfa9b7   adinpilavdzija/spring-petclinic-angular:latest   "/docker-entrypoint.…"   3 minutes ago    Up 3 minutes    0.0.0.0:4200->80/tcp     petclinic-angular

$ docker container inspect petclinic-angular --format "{{.Image}}" | cut -c1-19
sha256:9e8d0a9a034a
```

This setup will ensure that our server stays up-to-date with the most recent versions of the containers without requiring manual intervention for every code change.
