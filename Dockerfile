FROM centos:latest
RUN yum -y install httpd
COPY zzzstatus.conf /etc/httpd/conf.d/zzzstatus.conf
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
