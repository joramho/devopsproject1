pipeline {
    agent any
    tools { nodejs 'NodeJS 22' }
    stages {
        stage('Build') {
            steps {
                sh 'npm install'
                sh 'npm test'
            }
        }
    }
}

