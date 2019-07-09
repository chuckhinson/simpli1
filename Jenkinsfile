pipeline {

    agent any

    options {
        disableConcurrentBuilds()
        buildDiscarder(logRotator(numToKeepStr:'10'))
        timeout(time: 10, unit: 'MINUTES')
    }

    stages {

        stage ('Retrieve project from git') {
            steps {
                git (
                        url: 'https://github.com/chuckhinson/simpli1.git'
                )
            }
        }

        stage ('Build application and docker image') {
            steps {
                sh "mvn -B clean install"
            }
        }

        stage ('Push to docker hub') {
            steps {
                sh "mvn -B dockerfile:push"
            }
        }

        stage ('Start application') {
            steps {
            // Kill any old images
                sh "docker stop simpli1 || true"
                sh "docker run -d -p 8081:8080 --rm --name simpli1 chuckhinson/simpli1:0.1.0"
            }
        }



    }
}
