# Devops Project 1

Install Docker:
```
https://www.docker.com/products/docker-desktop/
```
Spin up a server: (Access from local host http://localhost:8080)
```
docker network create Jenkins
docker run --name jenkins-blueocean --rm -d -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home --network jenkins jenkins/jenkins:lts-jdk17
```
Get Initial admin password: 
```
docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
```
Create Github repo and set up webhook ( since I did it locally, I need to use ngrok to expose a public url instead of localhost:8080)
