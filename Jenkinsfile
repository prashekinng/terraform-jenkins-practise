pipeline {
    agent any

    environment {
      PATH = "${PATH}:${getTerraformPath()}"
    }
    
    stages {
        stage ('terraform init and apply for dev') {
           steps {
               sh "terraform init"
               sh returnStatus: true, script: 'terraform workspace new dev'
               sh "terraform apply -var-file=dev.tfvars -auto-approve"
           }
        }

        stage ('terraform init and apply for prod') {
           steps {
               sh "terraform init"
               sh returnStatus: true, script: 'terraform workspace new prod'
               sh "terraform apply -var-file=prod.tfvars -auto-approve"
           }
        }
    }
}

def getTerraformPath(){
    def tfHome = tool name: 'terraform12', type:'org.jenkinsci.plugins.terraform.TerraformInstallation'
    return tfHome
}

