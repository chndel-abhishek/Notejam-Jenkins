pipeline {

    agent any


    environment {

        DOCKERHUB_CREDENTIALS = credentials('dockerhub')

    }


    stages {

        stage("Install Docker") {

            steps {

                sh 'curl -fsSL https://get.docker.com -o get-docker.sh'

                sh 'sh get-docker.sh'

            }

        }


        stage("Clean-up") {

            steps {

                deleteDir()

            }

        }


        stage("Clone repo") {

            steps {

                sh "git clone https://github.com/AbhishekChandel1/Notejam-Jenkins.git"

            }

        }


        stage("Log-in") {

            steps {

                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'

            }

        }


        stage("Build") {

            steps {

                sh "docker build -t abhishek7868/notejam2 Notejam-Jenkins/"

            }

        }


        stage("Push-repo") {

            steps {

                sh "docker push abhishek7868/notejam2"

            }

        }

    }

}
