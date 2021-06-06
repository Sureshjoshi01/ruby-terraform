pipeline {
    agent any
    stages {
       stage('Repository  clone') {
          steps {
             sh 'git clone https://github.com/Sureshjoshi01/adjust-task'
          }
      }     
      stage('Build latest Docker Image ') {
          steps {
             sh 'ansible-playbook -i hosts playbook.yaml'
          }
      }    
      stage('Deploy Image to Kubernetes cluster using terraform  ') {
          steps {
             sh 'terraform apply -auto-approve'
          }
      }    
    }
}