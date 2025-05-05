pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                git 'https://github.com/your-username/your-repo.git' // Update repo URL
            }
        }
        
        stage('Build Image') {
            steps {
                script {
                    // Build using your existing image name
                    docker.build("basic:${env.BUILD_ID}")
                }
            }
        }
        
        stage('Run Container') {
            steps {
                script {
                    // Stop and remove old container first
                    sh 'docker stop basic-container || true'
                    sh 'docker rm basic-container || true'
                    
                    // Run new container
                    docker.image("basic:${env.BUILD_ID}").run(
                        "--name basic-container -d -p 8081:80"
                    )
                }
            }
        }
    }
    
    post {
        always {
            script {
                // Optional: Clean old images
                sh 'docker rmi basic:${BUILD_ID} || true'
            }
        }
    }
}