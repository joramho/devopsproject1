pipeline {
    agent any
    tools {
        nodejs 'node18'
    }
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
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

    post {
        always {
            archiveArtifacts artifacts: '**/test-results.xml', allowEmptyArchive: true
        }
    }
}
