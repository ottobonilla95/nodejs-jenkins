def app

pipeline {
    agent {
        docker {
            image 'node:lts-buster-slim'
            args '-p 3000:3000'
        }
    }
    environment {
        CI = 'true'
    }
    stages {
        stage('Build') {
            steps {
                // sh 'npm install'
                app = docker.build('ottobonilla95/nodejsjenkins')
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
