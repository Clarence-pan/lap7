# About LAP7 (Linux + Apache + PHP7)

Linux(CentOS7) + Apache + PHP7 environment.

# Install

`docker pull clarencep/lap7:centos7`


# Run

`docker run -d clarencep/lap7:centos7`

Note: since `SIGWINCH` is used by httpd to gracefully stop, 
while `docker run -it` without `-d` will emit `SIGWINCH` , 
`lap7` should always be started in daemon mode (`-d`). 
Otherwise, `lap7` will exit immediately.

# Logs

The logs of httpd will be output to the stdout/stderr of the 
container. So you can use `docker logs <container-name>` to see the logs.


## Versions: [versions.txt](./versions.txt)

## PHPINFO: [phpinfo.txt](./phpinfo.txt)
