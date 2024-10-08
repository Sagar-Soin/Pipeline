pipeline {
    agent any
    environment {
        AWS_REGION = 'ap-south-1'
        AWS_CREDENTIALS_ID = 'aws-crendentails-ssoin'
        TERRAFORM_DIR = './terraform'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Sagar-Soin/Pipeline.git'
            }
        }
        stage('Terraform init') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]){
                        dir("${TERRAFORM_DIR}") {
                        sh 'terraform init -reconfigure'
                        }
                }
            }
        }

        stage('Terraform plan') {
            steps {
                withCredentials([[$class: AmazonWebServicesCredentialsBinding, credentialsId: "${AWS_CREDENTIALS_ID}"]]){
                         dir("${TERRAFORM_DIR}") {
                         sh 'terraform plan'
                         }
                }
            }
        }
    
        stage('Terraform Apply') {
            steps {
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: "${AWS_CREDENTIALS_ID}"]]){
                         dir("${TERRAFORM_DIR}") {
                         sh 'terraform apply --auto-approve'
                         }
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

