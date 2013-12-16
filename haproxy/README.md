haproxy
========

Installation d'HAProxy dans un docker

On peut linker avec d'autres Docker pour générer automatiquement le fichier de config :

ex : 
```bash
docker run -rm=true -t -i -link=trusting_bohr:tom -link=agitated_ritchie:tom2 -p=:80 haproxy 
```

va lancer le haproxy qui va "pointer" sur les deux Tomcat

