pipeline {
	agent any
	
	environment {
		usernameDocker = "khouuloud"
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
		
		/*stage ("Clone"){
		      steps{
			echo "cloning"
			git branch: 'main', url: 'https://github.com/khouloudKE/DjangoApptest.git'
			
		      } 
		    }*/
		stage ('Test') {
			steps {
				try {
				sh 'virtualenv env -p python3.8'
				sh '. env/bin/activate'
				sh 'env/bin/pip install -r requirements.txt'
				sh 'env/bin/python3.8 test.py test'
				}
				catch (exec) {
					echo 'Test file not found' 
				}
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
				sh "docker login -u ${usernameDocker} -p ${dockerHubPwd}"
				sh "docker push ${registry}:latest"
			}
			}
		}

	
	}

}
