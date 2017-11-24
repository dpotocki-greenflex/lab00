pipeline {
  agent any
    stages {
      stage("fmt"){
        steps{
          sh "terraform init"
          sh "terraform fmt"
        }
       }
     }
 }
