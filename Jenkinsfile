
pipeline {
  agent any
  environment {
    DOCKER_IMAGE = 'yourdockerhub/ml-model'
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t $DOCKER_IMAGE .'
      }
    }
    stage('Push') {
      steps {
        withCredentials([string(credentialsId: 'dockerhub-password', variable: 'DOCKER_PWD')]) {
          sh 'echo $DOCKER_PWD | docker login -u yourdockerhub --password-stdin'
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
