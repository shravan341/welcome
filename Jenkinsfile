pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/your-username/your-html-repo.git' // Replace with your repo
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("html-app:${env.BUILD_ID}")
                }
            }
        }
        
        stage('Run Container') {
            steps {
                script {
                    dockerImage.run("-d --name html-container -p 8081:80")
                }
            }
        }
    }
    
    post {
        always {
            script {
                // Cleanup containers and images
                sh 'docker stop html-container || true'
                sh 'docker rm html-container || true'
                sh 'docker rmi html-app:${BUILD_ID} || true'
            }
        }
    }
}