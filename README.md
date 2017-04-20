# About LAP7 (Linux + Apache + PHP7)

Linux(CentOS7) + Apache + PHP7 environment.

# Install

`docker pull clarencep/lap7:centos7`


# Run

`docker run -d clarencep/lap7:centos7`

Note: since `SIGWINCH` is used by apache2 to gracefully stop, 
while `docker run -it` without `-d` will emit `SIGWINCH` , 
`lap7` should always be started in daemon mode (`-d`). 
Otherwise, `lap7` will exit immediately.

# Logs

The logs of apache2 is in the default location: `/var/log/apache2`.

As the main `apache2` process doesn't output any logs, if you wanna see the logs, you should run:

`docker exec <container-name> sh -c "tail -f /var/log/apache2/*"`


