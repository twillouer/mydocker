# OpenStack clients

All openstack clients (from http://docs.openstack.org/cli-reference/content/install_clients.html)


Usage:
 
 - `./run.sh <path to the 'sh' file>` [optional param to docker]



ex: 
`./run.sh ~/openstack-credential.sh -e OS_REGION_NAME=tr2`

to run the openstackclients with you own credential and define tr2 as your default region

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


