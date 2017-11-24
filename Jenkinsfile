pipeline {
  agent any
  stages {
    stage("fmt"){
      steps{
          echo "test"
          sh "terraform init"
          sh "terraform fmt"
      }
    }
  }
}
