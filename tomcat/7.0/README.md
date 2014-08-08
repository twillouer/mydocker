Base pour Apache Tomcat 7.0


Usage :

docker build -t tomcat7 .

docker run -P -v<répretoire_webapp>:/tomcat/webapps -d tomcat7
