FROM clarencep/php7:7.1

# install apache2
RUN DEBIAN_FRONTEND="noninteractive" \
    && sed 's/archive.ubuntu.com/mirrors.aliyun.com/' -i.bak /etc/apt/sources.list \
    && apt-get update -y \
    && apt-get install -y apache2 libapache2-mod-php7.1 \
    && rm -f /var/www/html/index.html \
    && echo '<?php phpinfo();' > /var/www/html/index.php \
    && apt-get clean \
    && apt-get autoclean \
    && apt-get remove -y \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80 443

CMD apache2ctl start && bash -c 'tail -f /var/log/apache2/*.log'
