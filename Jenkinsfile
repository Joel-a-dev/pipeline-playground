// start - Auxiliary functions

// end - Auxiliary fuctions

pipeline {
    agent any

    options {
        buildDiscarder(logRotator(numToKeepStr: '10'))
        disableConcurrentBuilds()
    }
    environment{
        VAR_1='environment variable 1' // environment variable in the pipeline's scope - all agents
    }

    stages {
        stage('Init') {
            // Stage where initial variables are calculated/processed
            // needed files are created and stashed
            // any other initialization required
            steps{
              echo 'Init Stage'
              sh 'echo "Today is: \n" && date'
              sh  "echo VAR_1 is set to ${VAR_1}"
            }
        }

        stage('This is a parallel stage execution'){
          parallel{
            stage('parallel stage1'){
              steps {
                echo 'parallel stage 1'
              }
            }
            stage('parallel stage2'){
              steps{
                echo 'parallel stage 1'
              }
            }
          }
        }

        stage('bat tests'){
          steps{
            bat 'testfairy-upload.bat'
          }
        }

        stage('test'){
            steps{
              echo "test stage"
              echo sh(returnStdout:true,script:'cat examples/test.txt')
            }
        }

        stage('publish'){
          steps{
            echo 'publish stage'
          }
        }
    }
    post {
        always {
          deleteDir()
        }
        success{
          slackSend (color: 'success', message: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
          updateGitlabCommitStatus name: 'jenkins ci job', state: 'success'
          echo "UNSTABLE: Job ${env.JOB_NAME} [${env.BUILD_NUMBER}] (${env.BUILD_URL})"
        }
        failure {
          slackSend (color: 'danger', message: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL})")
          updateGitlabCommitStatus name: 'jenkins ci job', state: 'failed'
          echo "FAILED: Job ${env.JOB_NAME} [${env.BUILD_NUMBER}] (${env.BUILD_URL})"
          
        }
    }
}
