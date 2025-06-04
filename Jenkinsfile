
pipeline {
  agent any
  environment {
    DOCKER_IMAGE = 'dockerhub/ml-model'
  }
  stages {
     stage('Checkout') {
      steps {
        git branch: 'main', credentialsId: 'git-cred', url: 'https://github.com/Subhajit112/mlops-aws-eks-pipeline.git'
      }
    }
    stage('Build') {
      steps {
        sh 'docker build -t $DOCKER_IMAGE .'
      }
    }
    stage('Push') {
      steps {
        withCredentials([string(credentialsId: 'dockerhub-password', variable: 'DOCKER_PWD')]) {
          sh 'echo $DOCKER_PWD | docker login -u dockerhub --password-stdin'
          sh 'docker push $DOCKER_IMAGE'
        }
      }
    }
    stage('Deploy to EKS') {
      steps {
        sh 'kubectl apply -f k8s/'
      }
    }
  }
}
