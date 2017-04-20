FROM clarencep/php7:centos7-php7.1

# install httpd
RUN yum install -y httpd \
    && rm -f /var/www/html/index.html \
    && echo '<?php phpinfo();' > /var/www/html/index.php \
    && yum clean all 

EXPOSE 80 443

COPY ./apache2-foreground /bin/apache2-foreground
RUN chmod +x /bin/apache2-foreground

CMD [ "/bin/apache2-foreground" ]
