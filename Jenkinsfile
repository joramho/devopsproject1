pipeline {
    agent any

    // Use the NodeJS plugin
    tools {
        nodejs 'Node_24'   // <-- This must match the name of the NodeJS installation in Jenkins Global Tool Configuration
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull code from GitHub
                git url: 'https://github.com/joramho/devopsproject1', branch: 'main'
            }
        }

        stage('Install Dependencies') {
            steps {
                // npm command will use NodeJS plugin environment
                sh 'npm install'
            }
        }

        stage('Run Tests') {
            steps {
                sh 'npm test'
            }
        }

        stage('Build') {
            steps {
                sh 'echo "Building project..."'
                // Add your build commands here
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}
