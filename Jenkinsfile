pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Install Dependencies') {
            steps {
                sh 'echo "Install Node/npm here"'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Run tests here"'
            }
        }
    }
}
