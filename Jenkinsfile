pipeline{
    agent any
    stages{
        stage("clone"){
            steps{
                 git branch: 'main', credentialsId: 'github-credentials', url: 'https://github.com/AbhishekChandel1/Notejam-Jenkins.git'
            }
        }
        stage("build"){
            steps{
                 sh 'docker build -f Dockerfile.app -t abhishek7868/notejam2'
            }
        }
    }
        
}
