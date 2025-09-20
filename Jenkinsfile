pipeline {
    agent {
        docker {
            image 'node:18-alpine'
            args '-u root:root'   // ensures npm can write to workspace
        }
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test'
            }
        }
    }
}

