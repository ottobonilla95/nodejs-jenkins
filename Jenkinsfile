
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

                    withCredentials([sshUserPrivateKey(credentialsId: 'bartrcashEC2', usernameVariable: 'USERNAME', keyFileVariable: 'KEYFILE')]) {
                        def remote = [:]
                        remote.name = 'otto-serversdsd'
                        remote.host = 'ec2-52-90-133-116.compute-1.amazonaws.com'
                        remote.user = USERNAME
                        remote.identityFile = KEYFILE
                        remote.allowAnyHosts = true
                        sshScript remote: remote, script: 'jenkins/scripts/updateDockerContainer.sh'
                    }
                }
            }
        }
    }
}
