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
      stage('Create Docker Image') {
         steps {
           sh 'docker image build -t abhishekdarapu/demo-k8s:latest .'
         }
      }
      stage('Push Docker Image') {
  	 steps{
	    withCredentials([usernamePassword( credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
            sh "docker login -u ${USERNAME} -p ${PASSWORD}"
            sh "docker push abhishekdarapu/demo-k8s:latest"
            }
         }
      }
      stage('Deploy Application on MiniKube') {
          steps {
                    sh 'envsubst < ${WORKSPACE}/miniKube-app.yml | kubectl apply -f -'
          }
      }
   }
}
