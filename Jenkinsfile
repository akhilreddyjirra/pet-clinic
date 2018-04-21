pipeline {
  agent any
  stages {
stage('Sonar') {
            steps {
                def scannerHome = tool 'Sonarqube'
                withSonarQubeEnv('Sonar6.7.2') {
                    sh "${scannerHome}/bin/sonar-scanner"
            }
      }
  }
}
