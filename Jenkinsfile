
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
                sh 'echo Building image...'

                script {
                    dockerImage = docker.build('ottobonilla95/nodejsjenkins' + ":$BUILD_NUMBER")
                }
            }
        }
        stage('Test') {
            steps {
                sh 'echo Testing...'
                script {
                    dockerImage.inside {
                        sh 'cd /usr/src/app'
                        sh 'ls'
                        sh 'npm run test'
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo Deploying....'
                script {
                    sh 'echo Pushing to docker hub...'

                    docker.withRegistry( '', registryCredential ) {
                        dockerImage.push()
                        dockerImage.push('latest')
                    }

                    sh 'echo Getting lastest image version on server...'

                    withCredentials([usernamePassword(credentialsId: 'digitalocean', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        def remote = [:]
                        remote.name = 'otto-server'
                        remote.host = '128.199.43.48'
                        remote.user = USERNAME
                        remote.password = PASSWORD
                        remote.allowAnyHosts = true
                        sshScript remote: remote, script: 'jenkins/scripts/updateDockerContainer.sh'
                    }
                }
            }
        }
    }
}
