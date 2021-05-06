
pipeline {
    agent any
    environment {
        CI = 'true'
        registry = 'ottobonilla95/nodejsjenknis'
        registryCredential = 'github'
        dockerImage = ''
    }

    stages {
        stage('Build') {
            steps {
                // sh 'npm install'
                script {
                    dockerImage = docker.build('ottobonilla95/nodejsjenkins' + ":$BUILD_NUMBER")
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    dockerImage.inside {
                        sh 'cd /usr/src/app'
                        sh 'ls'
                        sh 'npm run test'
                    }
                }
            }
        }

        stage('Deliver') {
            steps {
                sh 'echo Deliver........'
                script {
                        docker.withRegistry( '', registryCredential ) {
                            dockerImage.push()
                            dockerImage.push('latest')
                        }
                }
            }
        }
    }
}
