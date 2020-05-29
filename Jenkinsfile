pipeline {
  agent any
  stages {
    stage('Docker Image Build') {
      steps {
        script {
          sh 'docker-compose build'
        }

      }
    }

    stage('Docker push') {
      steps {
        script {
          withDockerRegistry([ credentialsId: "DockerHub", url: "" ])
          {
            sh 'docker push puneethk26/eventsdb:1.0'
            sh 'docker push puneethk26/eventsweb:1.0'

          }
        }

      }
    }
    stage('Deploy with Rundeck') {
      agent any
      steps {
        script {
          step([$class: "RundeckNotifier",
          rundeckInstance: "Rundeck",
          shouldFailTheBuild: true,
          shouldWaitForRundeckJob: true,
          options: """
            BUILD_VERSION=$BUILD_NUMBER
          """,
          jobId: "3f86add7-2064-4fe5-a822-afbe257e9518"])
        }
      }
    }
  }
}
