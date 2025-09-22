pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git (
                    url: 'https://github.com/joramho/hello-jenkins-node.git'
                    credentialsId: '8591430d-3dd6-454a-bad0-2bde53f9cb83'
                ) 
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