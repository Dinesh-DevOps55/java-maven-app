pipeline {
    agent any
    stages {
        stage("test") {
            steps {
                script {
                   echo "Testing the Application...."
                   echo "Executing pipeline for branch $BRANCH_NAME"
                }
            }
        }

        stage("build") {
            when {
                expression {
                    BRANCH_NAME == 'master'
                }
            }
            steps {
                script {
                   echo "Building the Application...."
                }
            }
        }

        stage("deploy") {
            when {
                expression {
                    BRANCH_NAME == 'master'
                }
            }
            steps {
                script {
                   echo "Deploying the Application...."
                }
            }
        }
    }
}
