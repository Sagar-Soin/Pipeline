pipeline {
    agent any
    environment {
        AWS_REGION = 'ap-south-1'
        AWS_CREDENTIALS_ID = 'aws-crendentails-ssoin'
        TERRAFORM_DIR = './terraform'
    }

    stages {
        stage('Terraform init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]){
                  sh """
                    cd ${TERRAFORM_DIR}
                    terraform init
                    """
                }
            }
        }
    }
}