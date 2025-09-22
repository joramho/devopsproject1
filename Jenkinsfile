pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Personal Access Token stored in Jenkins credentials with ID 'jenkins'
                git(
                    url: 'https://github.com/joramho/devopsproject1',
                    branch: 'main',
                    credentialsId: 'jenkins'
                )
            }
        }
        // verifies workspace location and files for debugging
        stage('Check Workspace') {
            steps {
                sh 'pwd'
                sh 'ls -la'
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
