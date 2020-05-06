pipeline {
    agent {
    node {
        label 'centos'
  	  }
	}
    environment {
        branch = 'master'
        scmUrl = 'https://github.com/Purushothamanan/javaApp.git'
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
		      sh 'cp -rf target/SampleApp-1.0-SNAPSHOT.war ../'
		      sh 'ls -lrt'
                    }
			}
	stage('create -&&- publish image') {
              steps {
 	      withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId:'dockerhub-7404298959', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD']]) {
		      sh 'docker login -u $USERNAME -p $PASSWORD'
		      sh 'docker build -t 7404298959/webapp:v1.0 .'
		      sh 'docker images'
		      sh 'docker push 7404298959/webapp:v1.0'
                      }
		}
	  }
    }	
}
