pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            sh 'mvn clean compile'
          }
        }
        stage('Sonar') {
          steps {
            waitForQualityGate()
          }
        }
      }
    }
  }
}