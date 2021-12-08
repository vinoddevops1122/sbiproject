pipeline{
    agent any
    tools {
        maven 'maven3'
    }
    stages{
        stage('Git checkout'){
            steps{
                checkout([$class: 'GitSCM', 
                branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'gitcred_new_cred', 
                url: 'https://github.com/vinoddevops1122/sbiproject.git']]])
            }
        }
        stage('Maven Build'){
            steps{
                bat 'mvn clean install'
            }
        }
        stage('Codequality'){
            steps{
                bat 'mvn sonar:sonar'
            }
        }
        stage('Deploy to War'){
            steps{
                deploy adapters: [tomcat8(credentialsId: 'tomcat_robot_new_cred', path: '', url: 'http://localhost:7000/')], contextPath: 'sbiproject', war: '**/*.war'
            }
        }
    }
}
