pipeline {
    agent any
    environment {
        DOCKER_IMAGE = 'hello-world-node'  // Имя Docker образа


        GOOGLE_CLOUD_PROJECT = 'terraform-tms-424012'
//         GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-service-account-key')
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    sh "docker compose -f compose-teffarorm.yml up -d"
                    sh "docker exec terraform_execute /bin/bash teraform init"
                    sh "docker exec terraform_execute /bin/bash teraform apply -auto-approve"

                    docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
//                     sh 'docker buid . -t ${DOCKER_IMAGE}:${env.BUILD_ID}'

                }
            }
        }

        stage('Web push') {
            steps {
                 script {
                    def app = sh(script: "gcloud compute instances describe terraform-tms-424012 --zone=us-east1-c --format='get(networkInterfaces[0].accessConfigs[0].natIP)'", returnStdout: true).trim()
                    echo "ip webserver: ${app}"
                    sh "curl -XGET 'http://${app}'"
                }
            }
        }
//         stage('Push') {
//             steps {
//                 script {
//                     docker.withRegistry(DOCKER_REGISTRY, REGISTRY_CREDENTIALS) {
//                     docker.image("${DOCKER_IMAGE}:${env.BUILD_ID}").push('latest')
//                     }
//                 }
//             }
//         }

//         stage('Deploy to GCP') {
//             steps {
//                 script {
//                     withCredentials([file(credentialsId: 'gcp-service-account-key', variable: 'GOOGLE_APPLICATION_CREDENTIALS')]) {
//                         sh '''
//                         export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS
//                         gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS
//                         gcloud config set project $GOOGLE_CLOUD_PROJECT
//                         gcloud auth configure-docker
//                         docker tag your-app:latest gcr.io/$GOOGLE_CLOUD_PROJECT/your-app:latest
//                         docker push gcr.io/$GOOGLE_CLOUD_PROJECT/your-app:latest
//                         gcloud compute ssh your-instance --command='docker pull gcr.io/$GOOGLE_CLOUD_PROJECT/your-app:latest && docker-compose up -d'
//                         '''
//                     }
//                 }
//             }
//         }

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
