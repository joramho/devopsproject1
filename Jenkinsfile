pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                sh 'npm install' // or 'pip install -r requirements.txt'
            }
        }
        stage('Test') {
            steps {
                sh 'npm test' // or 'pytest --junitxml=test-results.xml'
            }
        }
    }
    post {
        always {
            junit 'test-results.xml' // optional for Node/Python
        }
    }
}
