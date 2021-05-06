
pipeline {
    agent {
        docker {
            image 'node:lts-buster-slim'
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true'
        registry = 'ottobonilla95/nodejsjenknis'
        registryCredential = 'git'
        dockerImage = ''
    }

    stages {
        stage('Build') {
            steps {
                script {
                    dockerImage = docker.build("ottobonilla95/nodejsjenkins" + ":$BUILD_NUMBER")
                }
            }
        }
        stage('Test') {
            steps {
                sh "chmod +x -R ${env.WORKSPACE}"
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') {
            steps {
            // sh './jenkins/scripts/release.sh'
            // input message: 'Finished using the web site? (Click "Proceed" to continue)'
            // sh './jenkins/scripts/kill.sh'
            }
        }
    }
}

// node {
//     checkout scm
//     def customImage = docker.build("my-image:${env.BUILD_ID}")
//     customImage.push()

//     customImage.push('latest')
// }
