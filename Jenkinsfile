pipeline {
	agent any
	
	environment {
	registry = "khouuloud/djangotest"
	registryCredentials = 'django'
	app=''
	}
	
	stages {
		stage('Checkout'){
			steps{
				checkout scm
			}
		}
		
		stage ("Clone"){
		      steps{
			echo "cloning"
			git branch: 'main', url: 'https://github.com/khouloudKE/DjangoApptest.git'
			
		      } 
		    }
		
		stage ('Build'){
		      steps {
			echo "into build"
			script {
				app = docker.build("${registry}")
			}
		      }
		    }
		stage('Deploy'){
		      steps{
			echo "into deploy"
			      withCredentials([string(credentialsId:"${registryCredentials}", variable: 'dockerHubPwd')])
			{
				sh "docker login -u khouuloud -p ${dockerHubPwd}"
				sh "docker push ${registry}:latest"
			}
			}
		}

	
	}

}
