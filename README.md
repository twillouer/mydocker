mydocker
========

Scripts for using docker

Installation ici : http://docs.docker.io/en/latest/installation/ubuntulinux/

Ne pas oublier le firewall :

```bash
sudo vi /etc/default/ufw
----
# Change:
# DEFAULT_FORWARD_POLICY="DROP"
# to
DEFAULT_FORWARD_POLICY="ACCEPT"
---
```

Et le redémarrage :
```bash
sudo ufw reload
```
