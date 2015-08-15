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
