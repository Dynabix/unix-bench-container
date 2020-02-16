FROM centos:7

RUN yum update -y && \
	yum -y install gcc gcc-c++ make libXext-devel perl perl-Time-HiRes git && \
	yum -y groupinstall "Development Tools" && \
	yum -y install libX11-devel mesa-libGL-devel perl-Time-HiRes && \
	yum clean all && \
    	rm -rf /var/cache/yum

RUN git clone https://github.com/kdlucas/byte-unixbench.git
WORKDIR byte-unixbench/UnixBench/

# Change rights so that any user can execute the test

RUN chmod -R 777 .

USER 1001

CMD ./Run
# tail -f /dev/null
