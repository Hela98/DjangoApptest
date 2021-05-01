pipeline {
	agent any
	
	environment {
	registry = "khouuloud/djangotest"
	registryCredentials = 'dockerhubb'
	DOCKER_TAG = getDockerTag()
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
			app = docker.build("khouuloud/djangotest")
			}
		      }
		    }
		stage('Deploy'){
		      steps{
			echo "into deploy"
			withCredentials([string(credentialsId:'dockerhubb', variable: 'dockerHubPwd')])
			{
				sh "docker login -u khouuloud -p ${dockerHubPwd}"
				sh "docker push khouuloud/djangotest:latest"
			}
			}
		}

	
	}

}
def getDockerTag(){
	def tag = sh script: 'git rev-parse HEAD', returnStdout: true
	return tag
    }
