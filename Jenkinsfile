pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'hello-world-node'  // Имя Docker образа
        DOCKER_REGISTRY = ''  // Если используется частный Docker Registry
        REGISTRY_CREDENTIALS = 'docker-credentials-id'  // Идентификатор учетных данных для Docker
    }

    stages {
        stage('Checkout') {
            steps {
                // Клонируем репозиторий
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                }
            }
        }

        stage('Push') {
            steps {
                script {
                    docker.withRegistry(DOCKER_REGISTRY, REGISTRY_CREDENTIALS) {
                        docker.image("${DOCKER_IMAGE}:${env.BUILD_ID}").push('latest')
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    dockerCompose.down()
                    dockerCompose.up('--build -d')
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully!'
        }
        failure {
            echo 'Pipeline failed!'
        }
    }
}
