pipeline {
  environment {
    dockerimagename = "abhishek7868/notejam2"
    dockerImage = ""
  }
  agent any
  stages {
    stage('Checkout Source') {
      steps {
        git branch: 'main', credentialsId: 'github-credentials', url: 'https://github.com/AbhishekChandel1/Notejam-Jenkins.git'
        
      }
    }
    stage('Build image') {
      steps{
        script {
          dockerImage = docker build . abhishek7868/notejam2
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
    stage('Deploying Notejam container to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "postgres-deploy.yaml", "notejam-application-deploy.yaml")
        }
      }
    }
  }

