FROM clarencep/php7:centos7

# install httpd
RUN yum install -y httpd \
    && rm -f /var/www/html/index.html \
    && echo '<?php phpinfo();' > /var/www/html/index.php \
    && yum clean all 

EXPOSE 80 443

CMD [ "/usr/sbin/httpd -DFOREGROUND" ]
