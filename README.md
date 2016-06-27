Final Practice Exam - To be Delivered until 06/27/2016

We should develop a wrapper cookbook with the name webserver. This cookbook will setup apache2 and mysql in ubuntu, using vagrant with virtual box provider and checkout two git repos that will be the two sites, we will host in two fqdns chef-site.avenuecode.com and chef-portal.avenuecode.com both in port 80.

Sites:

https://github.com/jrvlima/chef-site
https://github.com/jrvlima/chef-portal

Tips:

In our training we did for CentOS, for Debian based OS settings are a little different.
We will need to load a berks dependency -> cookbook ‘apt’.
Chef have a git resource but you need to install git using package resource before.
Add entries in your host files with the domain names of our to sites for test.

Constraints:

MySQL Version 5.6 - ppa:ondrej/mysql-5.6
Ubuntu 12.04 - vagrant box -> 'hashicorp/precise64’
Use vagrant with bridge DHCP connections

## Chef Site
    - http://192.168.50.4:81
## Chef Portal
    - http://192.168.50.4:82
