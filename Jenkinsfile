
pipeline {
    agent any
    environment {
        CI = 'true'
        registry = 'ottobonilla95/nodejsjenknis'
        registryCredential = 'github'
        dockerImage = ''
    }

    stages {
        // stage('Build') {
        //     sh 'Building image...'
        //     steps {
        //         script {
        //             dockerImage = docker.build('ottobonilla95/nodejsjenkins' + ":$BUILD_NUMBER")
        //         }
        //     }
        // }
        // stage('Test') {
        //     steps {
        //         sh 'Testing...'
        //         script {
        //             dockerImage.inside {
        //                 sh 'cd /usr/src/app'
        //                 sh 'ls'
        //                 sh 'npm run test'
        //             }
        //         }
        //     }
        // }

        stage('Deploy') {
            steps {
                sh 'echo Deploying....'
                script {
                    sh 'echo Pushing to docker hub...'

                    // docker.withRegistry( '', registryCredential ) {
                    //     dockerImage.push()
                    //     dockerImage.push('latest')
                    // }

                    sh 'echo Getting lastest image version on server...'

                    withCredentials([usernamePassword(credentialsId: 'digitalocean', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                      
                        sh 'echo $USERNAME'
                        sh 'ssh $USERNAME@128.199.43.48 -p $PASSWORD'

                    }
                }
            }
        }
    }
}
