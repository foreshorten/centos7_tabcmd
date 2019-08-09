FROM centos/systemd
ENV container docker

RUN yum -y install systemd systemd-libs deltarpm

RUN curl https://packages.microsoft.com/config/rhel/7/prod.repo -so /etc/yum.repos.d/mssql-release.repo && \
yum update -y && \
ACCEPT_EULA=Y yum install -y mssql-tools unixODBC-devel && \
yum clean all

RUN  ln -s /opt/mssql-tools/bin/sqlcmd /usr/local/sbin/sqlcmd && \
     ln -s /opt/mssql-tools/bin/bcp /usr/local/sbin/bcp

#VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]


#docker run -d --rm -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /var/run:/var/run foreshorten/centos7-mssql-tools