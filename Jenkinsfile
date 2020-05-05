pipeline {
    agent {
    node {
        label 'centos'
  	  }
	}
    environment {
        branch = 'master'
        scmUrl = 'https://https://github.com/Purushothamanan/javaApp.git'
        serverPort = '8080'
    }
    stages {
        stage('checkout git') {
             steps {
             git branch: branch, credentialsId: 'GitCredentials', url: scmUrl
                  }
			}
        stage('build') {
              steps {
		      sh 'mvn clean package -DskipTests=true'
                    }
			}
	stage('create & publish image') {
              steps {
		      sh 'docker build -t 7404298959/webapp:v1.0 .'
		      sh 'docker images'
                    }
			}
		}	
}
