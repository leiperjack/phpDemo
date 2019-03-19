##### PHP ### CONTAINER #####

FROM ubuntu:16.04

#Update Repo
RUN apt-get update -y

#Install PHP modules
RUN apt-get install -y php-pear php-fpm php-dev php-zip php-curl php-xmlrpc php-gd php-mysql php-mbstring php-xml libapache2-mod-php

#Install Apache
RUN apt-get install -y apache2

#Copy application file
RUN rm -rf /var/www/html/*
ADD phpWebsite /var/www/html

#Open port 80
EXPOSE 80

#Start Apache service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]