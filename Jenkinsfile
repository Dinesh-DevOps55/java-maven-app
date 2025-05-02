pipeline {
  agents any
  tools {
    maven 'maven-3.9'
  }
  stage("build jar") {
    steps {
      script {
      echo "building the application..."
      sh 'mvn package'
    }
    }
  }
    stage("build image") {
    steps {
      script {
      echo "building the docker image..."
      withCredentials([usernamePassword(credentailsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVaribale: "USER")]) {
        sh 'docker build-t dineshdocker55/demo-app:jma-2.0 .'
        sh 'echo $PASS | docker login -u $USER --password-stdin'
        sh 'docker push dineshdocker55/demo-app:jma-2.0'
      }
      }
    }
  }
    stage("deploy") {
    steps {
      script {
      echo "deploying the application..."
    }
    }
  }
}
