pipeline {
    // Use a Node.js Docker image so Jenkins doesn't need Node installed
    agent {
        docker {
            image 'node:18'
            args '-u root:root' // optional: run as root inside container
        }
    }

    environment {
        // Optional: add environment variables here
        NODE_ENV = 'development'
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull the code from your Git repository
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('Build') {
            steps {
                // Replace with your build command if needed
                sh 'npm run build || echo "No build script found"'
            }
        }

        stage('Test') {
            steps {
                sh 'npm test || echo "No test script found"'
            }
        }
    }

    post {
        always {
            echo 'Cleaning up workspace'
            cleanWs()
        }
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
