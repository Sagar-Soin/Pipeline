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
        stage('Terraform plan') {
            steps {
                withCredentials([[$class: AmazonWebServicesCredentialsBinding, credentialsId: "${AWS_CREDENTIALS_ID}"]]){
                    sh """
                    cd ${TERRAFORM_DIR}
                    terraform plan
                    """ 
                }
            }
        }
    
        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]){
                    sh """
                    cd ${TERRAFORM_DIR}
                    terraform apply -auto-approve
                    """
                }
            }
        }
    } 
    post { 
        success {
            echo 'Terraform apply completed successfully'
        }
        failure {
            echo 'Terraform apply failed'
        }
    }
}