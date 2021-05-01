pipeline {
	agent any
	
	environment {
	registry = "****"
	registryCredentials = '---'
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
		stage ('Test') {
			steps{
			    sh 'virtualenv env -p python3.5'
			    sh '. env/bin/activate'
			    sh 'env/bin/pip install -r requirements.txt'
			    sh 'env/bin/python3.5 manage.py test --testrunner=djtrump.tests.test_runners.NoDbTestRunner'
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
