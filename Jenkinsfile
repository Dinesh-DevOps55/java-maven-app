pipeline {
    agent any
    tools {
        maven 'maven-3.9'
    }
    stages {
        stage("increment version") {
            steps {
                script {
                    echo 'incrementing app version ... '
                    sh 'mvn build-helper:parse-version versions:set \
                    -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} \
                    versions:commit'
                    def matcher = readFile('pom.xml') =~ '<version>(.+)</version>'
                    def version = matcher[0][1]
                    env.IMAGE_NAME = "$version-$BUILD_NUMBER"
                }
            }
        }
        
        stage("build app") {
            steps {
                script {
                   echo "building the Application...."
                    sh 'mvn clean package'
                }
            }
        }

    stage("build image") {
        steps {
            echo "building the docker image..."
            withCredentials([usernamePassword(credentailsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: "USER")]) {
            sh'docker build -t dineshdocker55/demo-app:{$IMAGE_NAME}.'
            sh 'echo $PASS | docker login -u $USER --password-stdin'
            sh 'docker push dineshdocker55/demo-app:{$IMAGE_NAME}'
      }
    }
  } 
        stage("Deploy app") {
            steps {
                script {
                   echo "deploying docker image...."
                }
            }
        }
        }
    }
