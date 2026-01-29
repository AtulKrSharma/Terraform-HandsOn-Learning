#!/bin/bash

sudo -i
yum update -y
yum install -y nginx
systemctl start nginx
systemctl enable nginx
echo "<h1>Hello World from Nginx- $(hostname -f)</h1>" > /usr/share/nginx/html/index.html