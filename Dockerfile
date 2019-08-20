FROM centos/systemd

RUN yum install -y https://downloads.tableau.com/esdalt/2019.2.0/tableau-tabcmd-2019-2-0.noarch.rpm deltarpm && \
yum update -y && \
yum clean all

RUN  ln -s /opt/tableau/tabcmd/bin/tabcmd /usr/local/sbin/tabcmd  
#echo $(md5sum < /home/tableau/.tableau/tabcmd/.eula_accepted_*| awk '{print $1}') |  passwd --stdin tableau  

RUN groupadd -r -g 1000 tableau && \
useradd -u 1000 -g 1000 tableau

USER tableau

RUN tabcmd --accepteula

WORKDIR /home/tableau

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
