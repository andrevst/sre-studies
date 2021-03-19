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
# Backup it
docker cp my-jenkins-1:/var/jenkins_home ~/jenkins_backup
```

### 2 Running it with persistent Volumes

### 3 Using Dokcer-compose

## References

-[How to Run Jenkins in Docker using Docker Compose with Volumes](https://adamtheautomator.com/jenkins-docker/)
