node
{
    def mavenHome = tool name: 'maveen-3.6.1', type: 'maven' 
    
    stage('Pull_Code_GitHub')
    {
        git credentialsId: 'git', url: 'https://github.com/teejaswin/maven-web-application.git'
    }
    
    stage('Build_Maven')
    {
        sh "${mavenHome}/bin/mvn clean package"
    }
    
    stage('SonarQube_Push')
    {
        sh "${mavenHome}/bin/mvn sonar:sonar"
    }
    
    stage('Nexus_Push')
    {
        sh "${mavenHome}/bin/mvn clean deploy"
    }
    
    stage('Deploy_Tomcat')
    {
        sh "cp ${WORKSPACE}/target/*.war /opt/apache-tomcat-9.0.20/webapps"
    }
    
    stage('Deploy_Wildfly_Diff_Instance')
    {
        sh "scp ${WORKSPACE}/target/*.war ec2-user@52.66.248.248:/opt/wildfly-16.0.0.Final/standalone/deployments"
    }
        
}    
