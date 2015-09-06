# OpenStack clients

All openstack clients (from http://docs.openstack.org/cli-reference/content/install_clients.html)


Usage:
 
 - `./run.sh <path to the 'sh' file>` [optional param to docker]
 - `docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient nova list`
 - `alias nova='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient nova'`


ex: 
`./run.sh ~/openstack-credential.sh -e OS_REGION_NAME=tr2`

to run the openstackclients with you own credential and define tr2 as your default region

Aliases:
```
alias terraform='docker run --rm --net=host --user=$UID:$GID -v $PWD:/data -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" -ti uzyexe/terraform'
alias nova='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient nova'
alias neutron='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient neutron'
alias openstack='docker run --rm -ti --user=$UID:$GID  -e OS_AUTH_URL="$OS_AUTH_URL" -e OS_TENANT_ID="$OS_TENANT_ID" -e OS_TENANT_NAME="$OS_TENANT_NAME" -e OS_REGION_NAME="$OS_REGION_NAME" -e OS_USERNAME="$OS_USERNAME" -e OS_PASSWORD="$OS_PASSWORD" twillouer/mydocker:openstackclient openstack'
```

In the container:

- nova list 
- neutron net-list
- openstack flavor list
- openstack images list
- openstack network list


# Want to try docker-machine :

https://docs.docker.com/machine/drivers/openstack/

##Start the openstack client

`./run.sh openrc.sh -e OS_REGION_NAME=<region_name>`

## retrieve flavor list

`openstack flavor list`

## retrieve image list

`openstack image list`

## retrieve network list


`openstack network list`

## retrieve floating pool list

`openstack ip floating pool list`

## start the docker-machine

`docker-machine -D create --driver openstack --openstack-flavor-name 4_vCPU_RAM_8G_HD_10G --openstack-image-name ubuntu-14.04_x86_64 --openstack-net-name inet-001 --openstack-floatingip-pool PublicNetwork-01 --openstack-ssh-user stack mamachineamoi`

Take a break. Don't forget to open the 2376 port on your openstack firewall _for your ip only_.

## Install the local environment

`eval "$(docker-machine env mamachineamoi)"`

check if it works :

`docker info`

## For example, start a mongodb

`docker run -d -p=27017:27017 mongo`

## Clean

`docker-machine rm mamachineamoi`

don't forget to manually release the floating ip if needed


## With docker-swarm

```
root@2cf3dcad109e:/# TOKEN=$(docker run swarm create)
root@2cf3dcad109e:/# docker-machine -D create --driver openstack --openstack-flavor-name 4_vCPU_RAM_8G_HD_10G --openstack-image-name ubuntu-14.04_x86_64 --openstack-net-name inet-001 --openstack-floatingip-pool PublicNetwork-01 --openstack-ssh-user stack --swarm --swarm-master --swarm-discovery token://$TOKEN swarm-master
```

Now, create a 2 nodes cluster:

```
root@2cf3dcad109e:/# docker-machine -D create --driver openstack --openstack-flavor-name 4_vCPU_RAM_8G_HD_10G --openstack-image-name ubuntu-14.04_x86_64 --openstack-net-name inet-001 --openstack-floatingip-pool PublicNetwork-01 --openstack-ssh-user stack --swarm --swarm-discovery token://$TOKEN swarm-node-00
root@2cf3dcad109e:/# docker-machine -D create --driver openstack --openstack-flavor-name 4_vCPU_RAM_8G_HD_10G --openstack-image-name ubuntu-14.04_x86_64 --openstack-net-name inet-001 --openstack-floatingip-pool PublicNetwork-01 --openstack-ssh-user stack --swarm --swarm-discovery token://$TOKEN swarm-node-01
```

On the swarm-master, we can now run a new container:

```
eval $(docker-machine env --swarm swarm-master)
docker info
```

List all nodes:

```
docker run --rm swarm list token://$TOKEN
```

And now, we can start dockers into the swarm environment: (see https://docs.docker.com/swarm/scheduler/filter/)



# Install an image 

For example CoreOS (https://coreos.com/os/docs/latest/booting-on-openstack.html)

```
wget http://stable.release.core-os.net/amd64-usr/current/coreos_production_openstack_image.img.bz2
bunzip2 coreos_production_openstack_image.img.bz2

./run.sh ~/openstack.sh -v $PWD:/images
```

Inside the docker, let use glance:

```
glance image-create --name CoreOS \
  --container-format bare \
  --disk-format qcow2 \
  --file /images/coreos_production_openstack_image.img \
  --is-public False
```
