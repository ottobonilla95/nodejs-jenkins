
pipeline {
    agent any
    environment {
        CI = 'true'
        registry = 'ottobonilla95/nodejsjenknis'
        registryCredential = 'github'
        dockerImage = ''
    }

    stages {
        stage('Deploy') {
            steps {
                sh 'echo Deploying....'
                script {
                    sh 'echo Pushing to docker hub...'

                    sshagent (credentials: ['bartrcashEC2']) {
                        sh 'ssh -o StrictHostKeyChecking=no -l ubuntu ec2-52-90-133-116.compute-1.amazonaws.com uname -a'
                        sh 'ls'
                    }

                 
                }
            }
        }
    }
}
