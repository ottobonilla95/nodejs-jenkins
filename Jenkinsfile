
pipeline {
    agent any
    environment {
        CI = 'true'
        registry = 'ottobonilla95/nodejsjenknis'
        registryCredential = 'git'
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
        // sh "chmod +x -R ${env.WORKSPACE}"
        // sh './jenkins/scripts/test.sh'
        }

        stage('Deliver') {
            steps {
                sh 'echo Deliver........'
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
