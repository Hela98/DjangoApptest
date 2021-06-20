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

    /*stage('Test') {
        
        //agent { dockerfile true }
        steps{
        
        script {
            //sh "docker exec ${dockerImage.id} ./manage.py test"
            //sh "docker exec mycontainer /path/to/test.sh"
            dockerImage.withRun("--name run-$BUILD_ID -p 8081:8080") {c ->
        
                    dockerImage.inside("""--entrypoint=''""") {
                    //sh "./manage.py makemigrations"
                    //sh "./manage.py migrate"
                    //sh "docker run --privileged"
                    sh "sudo su jenkins"
                    sh "sudo chmod a+x -R ${env.WORKSPACE}"
                    sh "sudo chmod a+x /app/test.sh"
                    sh '/app/test.sh'
                    //sh "./manage.py test"
                     }
             }
        }
    }
  }*/
      
    
    
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
