pipeline {
    agent any
    stages {
        stage("GitHub Clone") {
            steps {
                git branch: 'main', url: 'https://github.com/ash2code/stop-watch.git'
            }
        }
        stage("Build Docker Image") {
            steps {
                script {
                    sh "docker build -t ash2code/javascriptstopwatch ."
                }   
            }
        }
        stage("Run Docker Container") {
            steps {
                script {
                    // Stop and remove existing container if it exists
                    sh '''
                        docker container stop javascriptstopwatch || true
                        docker container rm javascriptstopwatch || true
                        docker container run -dt --name javascriptstopwatch -p 8083:80 ash2code/javascriptstopwatch
                    '''
                }
            }
        }
        stage("Docker Login & Push") {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: '4cd9fdf1-94c8-4622-a734-6d0ae950198f', 
                                                   usernameVariable: 'DOCKER_USERNAME', 
                                                   passwordVariable: 'DOCKER_PASSWORD')]) {
                        sh '''
                            echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin
                            docker push ash2code/javascriptstopwatch
                        '''
                    } 
                }
            }
        }
    }
    
    post {
        always {
            // Clean up workspace
            cleanWs()
        }
        failure {
            echo 'Pipeline failed!'
        }
        success {
            echo 'Pipeline completed successfully!'
        }
    }
}
