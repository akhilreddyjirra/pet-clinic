pipeline {
  agent any
  stages {
    stage('Build') {
      parallel {
        stage('Build') {
          steps {
            sh 'mvn clean compile'
            waitForQualityGate()
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