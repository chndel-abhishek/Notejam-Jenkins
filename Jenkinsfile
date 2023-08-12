pipeline {
  environment {
    dockerimagename = "abhishek7868/notejam-jenkins"
    dockerImage = ""
  }
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git branch: 'main', url: 'https://github.com/AbhishekChandel1/kube.git'
      }
    }
    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build abhishek7868/notejam-jenkins
        }
      }
    }
    stage('Pushing Image') {
      environment {
               registryCredential = 'dockerhub'
           }
      steps{
        script {
          docker.withRegistry( 'https://registry.hub.docker.com', registryCredential ) {
            dockerImage.push("latest")
          }
        }
      }
    }
    stage('Deploying React.js container to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "postgres-deploy.yaml", "notejam-application-deploy.yaml")
        }
      }
    }
  }
}