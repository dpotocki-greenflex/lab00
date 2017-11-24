pipeline {
  agent any
  stages {
    stage("fmt"){
      steps{
          ercho "test"
          sh "terraform init"
          sh "terraform fmt"
      }
    }
  }
}
