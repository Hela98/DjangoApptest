pipeline {
    
  environment {
    registry = "hela98/djangotest"
    registryCredential = 'dockerhub'
    dockerImage = ''
    DOCKER_TAG = 'latest'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        checkout scm
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$DOCKER_TAG"
        }
      }
    }

    stage('Test') {
        agent {
                docker { image dockerImage}
            }
        //agent { dockerfile true }
        steps{
        
        script {
            //sh "docker exec ${dockerImage.id} ./manage.py test"
            //sh "docker exec mycontainer /path/to/test.sh"
            //dockerImage.withRun('-u root') {c ->
        
                    //dockerImage.inside("""--entrypoint=''""") {
                    //sh "./manage.py makemigrations"
                    //sh "./manage.py migrate"
                    //sh "docker run --privileged"
                    sh "./manage.py test"
                     //}
             //}
        }
    }
  }
      
    
    
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push('latest')
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $registry:$DOCKER_TAG"
      }
    }
  }
}
