pipeline {
    agent any

    stages {
        stage('fmt') {
            steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws_creds',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
            	   ]]) {
                    dir ('webapp') {
                        sh 'terraform init'
                        sh 'terraform fmt'
                    }
            	   }
            }
        }
	stage('plan') {
	    steps {
                withCredentials([[
                    $class: 'AmazonWebServicesCredentialsBinding',
                    credentialsId: 'aws_creds',
                    accessKeyVariable: 'AWS_ACCESS_KEY_ID',
                    secretKeyVariable: 'AWS_SECRET_ACCESS_KEY'
                   ]]) {
                    dir ('webapp') {
                        sh 'terraform plan'
                    }
                   }
            }

    	}	
    }
   
}    	


