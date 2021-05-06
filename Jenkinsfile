
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

        stage('Deliver') {
            steps {
                sh 'Deploying image'
                script {
                    sh 'Pushing to docker hub...'

                    // docker.withRegistry( '', registryCredential ) {
                    //     dockerImage.push()
                    //     dockerImage.push('latest')
                    // }

                    sh 'Getting lastest image version on server...'

                    withCredentials([usernamePassword(credentialsId: 'github', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                        // available as an env variable, but will be masked if you try to print it out any which way
                        // note: single quotes prevent Groovy interpolation; expansion is by Bourne Shell, which is what you want
                        sh 'echo $PASSWORD'
                        // also available as a Groovy variable
                        echo USERNAME
                        // or inside double quotes for string interpolation
                        echo "username is $USERNAME"
                    }
                    def remote = [:]
                    remote.name = 'test'
                    remote.host = '128.199.43.48'
                    remote.user = $USERNAME
                    remote.password = $PASSWORD
                    remote.allowAnyHosts = true
                    // stage('Remote SSH') {
                    //     writeFile file: 'abc.sh', text: 'ls -lrt'
                    //     sshScript remote: remote, script: 'abc.sh'
                    // }
                }
            }
        }
    }
}
