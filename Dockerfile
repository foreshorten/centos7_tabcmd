FROM centos/systemd

ENV container docker

RUN yum install -y https://downloads.tableau.com/esdalt/2019.2.0/tableau-tabcmd-2019-2-0.noarch.rpm deltarpm && \
yum update -y && \
yum clean all

RUN  ln -s /opt/tableau/tabcmd/bin/tabcmd /usr/local/sbin/tabcmd  &&\
tabcmd --accepteula > /dev/null

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]