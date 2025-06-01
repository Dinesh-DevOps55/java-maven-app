#!/user/bin/env groovy

@Library('8-jenkins-shared-library')
def gv

pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage("init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage("build jar") {
            steps {
                script {
                    buildJar() // namee of the file in REPO 8-jenkins-shared-library > vars
                }
            }
        }
        stage("build image") {
            steps {
                script {
                    buildImage() // name of the file in REPO 8-jenkins-shared-library > vars
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    gv.deployApp()
                }
            }
        }
    }
}