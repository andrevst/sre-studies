# Jenkins 2 Docker 

> Jenkins S2 Docker even in WLS 2

The goal of this repo is to define what is necessary to run Jenkins in Docker in a Windows Subsytem for Linux 2

## Pre-requisites

- Windows Subsystem for Linux 2
- Docker

## Steps

### 1 Run Jenkins on Docker

```shell
docker run --name my-jenkins-v1 -p 8081:8080 -p 50001:50000 jenkins/jenkins:lts
# change local ports to avoid issues with WSL
```

- Access Jenkins at [http://localhost:8081](http://localhost:8081) and setup it.

> Remember, your password is here:

```shell
*************************************************************
*************************************************************
*************************************************************

Jenkins initial setup is required. An admin user has been created and a password generated.
Please use the following password to proceed to installation:

#This is the password
a323393793144d52801cd7325f4ffae2

This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

*************************************************************
*************************************************************
*************************************************************
```

- Access the Jenkins container and Backup:

```shell
# Check Jenkins content
docker exec my-jenkins-v1 ls -l /var/jenkins_home
# Backup it in current folder
docker cp my-jenkins-1:/var/jenkins_home ./jenkins_backup
```

### 2 Running it with persistent Volumes

- Create a new Jenkins Docker container

```shell
docker run -d --name my-jenkins-v2 -p 8082:8080 -p 50002:50000 -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts
```

- After configure Jenkins, find jenkins data

```shell
docker volume inspect jenkins_home
```

- Make a backup of it

### 3 Using Dokcer-compose

- Create [docker-compose.yml](./docker-compose.yml)
  - Map the local volume with the container value

```shell
# Start the container
docker-compose up -d

# Get the initial admin password
docker exec my-jenkins-v3 cat /var/jenkins_home/secrets/initialAdminPassword

```

## References

-[How to Run Jenkins in Docker using Docker Compose with Volumes](https://adamtheautomator.com/jenkins-docker/)
-[RequestsDependencyWarning: urllib3 (1.25.2) or chardet (3.0.4) doesn't match a supported version! Fix](https://stackoverflow.com/questions/56155627/requestsdependencywarning-urllib3-1-25-2-or-chardet-3-0-4-doesnt-match-a-s)
- [How to run docker-compose under WSL 2](https://stackoverflow.com/questions/60746121/how-to-run-docker-compose-under-wsl-2)
