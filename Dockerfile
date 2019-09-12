## Cloned from https://github.com/npho/rstudio-server; 
## Original Author "Nam Pho" nampho@me.com
## minimum functionality RStudio server in a CentOS environment.
## docker build -t centos-rstudio:v4 .
## docker run -ti -v c:\dockerdata:/dockerdata centos-rstudio:v4
## docker run -d -p 80 centos-rstudio:v4
## execute "route /P add 172.16.0.0 MASK 255.240.0.0 10.0.75.2" on Windows docker host to connect

FROM centos:latest

LABEL maintainer="adam.ormond@appliedis.com"

RUN yum upgrade -y

RUN yum install initscripts -y # not included in Docker container

RUN rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7
RUN yum install epel-release -y \
 && yum install R -y

RUN yum install https://download2.rstudio.org/rstudio-server-rhel-1.1.463-x86_64.rpm -y
RUN export PATH=/usr/lib/rstudio-server/bin/:$PATH
RUN useradd rstudio
RUN echo "rstudio:rstudio" | chpasswd

RUN yum -y groupinstall "Development Tools"

## replace default R_LIBS_USER directory in /usr/lib64/R/etc/Renviron
RUN sed -i 's|~/R/x86_64-redhat-linux-gnu-library/3.6|/dockerdata|g' /usr/lib64/R/etc/Renviron

## configure rstudio to accept connections on port 80
RUN echo 'www-port=80' >> /etc/rstudio/rserver.conf

## command to mount local CRAN repo
CMD exec /usr/lib/rstudio-server/bin/rserver --server-daemonize 0

## configure container to allow connections on port 80
EXPOSE 80 443
