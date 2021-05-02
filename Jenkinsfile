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
				sh 'apt-get install python-virtualenv'
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
