Base pour Apache Tomcat 5.5


Usage :

docker build -t tomcat55 .

docker run -P -v<répretoire_webapp>:/tomcat/webapps -d tomcat55
