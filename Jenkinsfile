pipeline {
   agent any
   environment {
     registryCredential = 'dockerhub'
     dockerImage = ''
   }
   stages {
      stage('Preparation') {
         steps {
            cleanWs()
            git credentialsId: 'GitHub', url: "https://github.com/abhishekdarapu/demo-k8s"
         }
      }
      
   }
}
