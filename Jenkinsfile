pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // If using GitHub, replace URL below with your repo
                git 'https://github.com/joramho/hello-jenkins-node.git'
            }
        }

        stage('Check Node.js') {
            steps {
                sh 'node -v'
                sh 'npm -v'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Run App') {
            steps {
                sh 'node app.js'
            }
        }
    }

    post {
        success {
            echo 'Pipeline ran successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}