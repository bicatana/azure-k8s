#!groovy

withCredentials([azureServicePrincipal('credentials_id')]) {


 // Build Parameters
 env.CLIENT = "${env.AZURE_CLIENT_ID}"
 env.SECRET = "${env.AZURE_CLIENT_SECRET}"
 env.TENANT = "${env.AZURE_TENANT_ID}"
 env.SUBS   = "${env.AZURE_SUBSCRIPTION_ID}"
 node {
 //Pipeline
   env.PATH += ":/opt/terraform_0.11.11/"
   stage ('Azure Login') {
     sh "az login --service-principal -u ${env.CLIENT} -p ${env.SECRET} -t ${env.TENANT}"
   }
 //${env.GIT_BRANCH}
   stage ('Checkout') {
     checkout([$class: 'GitSCM', branches: [[name: "*/master"]], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [],  userRemoteConfigs: [[credentialsId: 'credentials_id', url: 'git_url']]])
   }

   stage ('Terraform Init') {
     sh 'terraform init -no-color'
   }

   stage ('Terraform Plan') {
     sh "terraform plan -no-color -out=create.tfplan -var CLIENT=${env.CLIENT} -var TENANT=${env.TENANT} -var SECRET=${env.SECRET} -var SUBS=${env.SUBS}"
   }

   stage ('Terraform Apply') {
     sh "terraform apply -no-color -auto-approve -var CLIENT=${env.CLIENT} -var TENANT=${env.TENANT} -var SECRET=${env.SECRET} -var SUBS=${env.SUBS}"
   }

   stage ('Notification') {
     slackSend color: 'green', message: "Terraform Apply - Jenkins job ${env.JOB_NAME} - build ${env.BUILD_NUMBER} complete"
   }
 }
}
