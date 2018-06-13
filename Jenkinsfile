pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t app:test .'
      }
    }
    stage('Test') {
      steps {
        echo 'TEST'
        sh 'docker run --rm --name app -id -p 80:80 app:test'
        sh '/bin/nc -vz localhost 22'
      }
      post {
        always {
          sh 'docker container stop app'
        }
      }
    }
    stage('Push Registry') {
      steps {
        withCredentials([usernamePassword(credentialsId: '7f06fc9a-dd82-4154-88a4-11992285ebfd', passwordVariable: 'password', usernameVariable: 'user')]) {
          sh 'docker tag app:test jloste/app:stable'
          sh 'docker push jloste/app:stable'
        }
      }
    }
  }
}