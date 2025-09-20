pipeline {
    agent any
    tools { nodejs "NodeJS 20" }  // name from Global Tool Config
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }
    }
}
