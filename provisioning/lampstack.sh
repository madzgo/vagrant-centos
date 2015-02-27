#!/bin/bash

# function to check if package is installed
function isnotinstalled {
  if rpm -qa | grep -qw "$@"; then
    return 1
  else
    return 0
  fi
}

if isnotinstalled httpd; then 

	# add new yum repository for php 5.5
	rpm -Uvh https://mirror.webtatic.com/yum/el6/latest.rpm

	# install main LAMP packages
	yum install -y httpd php55w mysql mysql-server

	chkconfig mysql-server on
	chkconfig mysqld on
	chkconfig httpd on

	/etc/init.d/mysqld restart

	# set mysql password
	/usr/bin/mysqladmin -u root password "root1234"

	# remove iptables because we don't need to block ports
	rm -rf /etc/init.d/iptables
	rm -rf /etc/init.d/ip6tables

	# install php packages
	yum install -y php55w-common php55w-mysql php55w-pdo php55w-opcache php55w-xml php55w-soap php55w-cli php55w-devel php55w-fpm php55w-gd php55w-snmp php55w-tidy curl curl-devel php55w-mcrypt php55w-mbstring php55w-xmlrpc php55w-pecl-xdebug
	
fi

# synchronize vhosts file
/bin/cp -rf /var/www/html/config/vhosts.conf /etc/httpd/conf.d/vhosts.conf

# synchronize php.ini, httpd.conf
/bin/cp -rf /var/www/html/config/php.ini /etc/php.ini
/bin/cp -rf /var/www/html/config/httpd.conf /etc/httpd/conf/httpd.conf

# restart httpd (if vhosts are changed)
service httpd stop
service httpd start
service mysqld start

echo 'done'
