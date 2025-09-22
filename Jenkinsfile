pipeline {
    agent any

    // Use your configured NodeJS installation name exactly
    tools {
        nodejs 'Node 20'  // <-- Replace with the exact name from Global Tool Configuration
    }

    stages {
        stage('Checkout') {
            steps {
                // Clone your GitHub repo
                git url: 'https://github.com/joramho/devopsproject1', branch: 'main'
            }
        }

        stage('Check Node.js') {
            steps {
                // Verify Node and npm versions
                sh 'node -v'
                sh 'npm -v'
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install npm packages
                sh 'npm install'
            }
        }

        stage('Run Hello World') {
            steps {
                // Run a simple Node.js script (e.g., app.js)
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
