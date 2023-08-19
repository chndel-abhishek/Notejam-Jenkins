pipeline {

    agent any


    environment {

        DOCKERHUB_CREDENTIALS = credentials('dockerhub')
        KUBECONFIG = credentials('kubernetes')
    }


    stages {


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

                sh "docker build -t abhishek7868/notejam-application --no-cache Notejam-Jenkins/"

            }

        }
        stage("Push-repo") {

            steps {

                sh "docker push abhishek7868/notejam-application"

            }
        }
        stage("Start Config Maps and Secrets") {

            steps {
              
                      sh "kubectl --kubeconfig $KUBECONFIG apply -f /var/lib/jenkins/workspace/Notejam-pipeline/Notejam-Jenkins/secret.yaml"
                      sh "kubectl --kubeconfig $KUBECONFIG apply -f /var/lib/jenkins/workspace/Notejam-pipeline/Notejam-Jenkins/config.yaml"
                  
            }
        }
        stage("Start Database") {

            steps {
              
                      sh "kubectl --kubeconfig $KUBECONFIG apply -f /var/lib/jenkins/workspace/Notejam-pipeline/Notejam-Jenkins/postgres-deploy.yaml"
                  
            }
        }
         stage("Start Application") {

            steps {
              
                      sh "kubectl --kubeconfig $KUBECONFIG apply -f /var/lib/jenkins/workspace/Notejam-pipeline/Notejam-Jenkins/postgres-deploy.yaml"
                  
            }
        }
        stage("Minikube Service List") {

            steps {
              
                      sh "minikube service list"
                  
            }
        }

    }

}
