#!/usr/bin/env bash
# using Puppet to automate the task of creating a custom HTTP header response
exec { 'http header':
	command  => 'sudo apt-get -y update;
	sudo apt-get install -y nginx;
	sudo sed -i "/server_name _/a add_header X-Served-By $HOSTNAME;" /etc/nginx/sites-enabled/default
	sudo nginx -t;
	sudo service nginx restart',
	provider => shell,
}
