pipeline {
    agent any

    environment {
        IMAGE_NAME = "te7a0/myapp"
        TAG = "${BUILD_NUMBER}"
        REPO_URL = "https://github.com/te7a0/MY-PROJ.git"
    }

    stages {

        stage('Clean Workspace') {
            steps {
                sh 'rm -rf *'
            }
        }

        stage('Clone Repository') {
            steps {
                sh 'git clone $REPO_URL .'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$TAG ./myapp'
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                }
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push $IMAGE_NAME:$TAG'
            }
        }
    }
}
