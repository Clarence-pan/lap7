FROM clarencep/php7:ubuntu

# install apache2
RUN DEBIAN_FRONTEND="noninteractive" \
    # && sed 's/archive.ubuntu.com/mirrors.aliyun.com/' -i.bak /etc/apt/sources.list \
    && apt-get update -y \
    && apt-get install -y apache2 libapache2-mod-php7.1 \
    && rm -f /var/www/html/index.html \
    && echo '<?php phpinfo();' > /var/www/html/index.php \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get remove -y \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80 443

COPY ./apache2-foreground /bin/apache2-foreground
RUN chmod +x /bin/apache2-foreground

CMD [ "/bin/apache2-foreground" ]
