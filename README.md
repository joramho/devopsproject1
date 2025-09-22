# Devops Project 1 CI/CD Simple App

Install Docker:
```
https://www.docker.com/products/docker-desktop/
```
Spin up a server: (Access from local host http://localhost:8080)
```
docker network create jenkins
docker run -d --name jenkins-blueocean \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  jenkins/jenkins:lts
```
Get Initial admin password: 
```
docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword
```
Create Github repo and set up webhook ( since I did it locally, I need to use ngrok to expose a public url instead of localhost:8080)
```
ngrok http http://localhost:8080
```

Push sample app to github repo: (hello-node)

Create Jenkinsfile (see Jenkinsfile)

Create Pipeline job in Jenkins
```
name: simple-ci-cd
```
Configure
Select pipeline from SCM under definition
Select Pipeline from SCM → Git → Enter your repo URL.
Branch: main.
Script Path: Jenkinsfile.
Save → Build Now.
