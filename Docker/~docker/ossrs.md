FROM    centos:latest

RUN     yum update -y
RUN     yum install -y gcc-c++
RUN     yum install -y make
RUN     yum install -y patch
RUN     yum install -y unzip
RUN     yum install -y pcre-devel
RUN     yum install -y automake
RUN     yum install -y libtool
RUN     yum install -y zlib-devel
RUN     yum install -y valgrind valgrind-devel

RUN     yum install -y git

WORKDIR ~
RUN     git clone https://github.com/ossrs/srs.git && \
        cd srs/trunk 
RUN     mkdir srs/trunk/objs/ 
RUN     unzip srs/trunk/3rdparty/CherryPy-3.2.4.zip
RUN     mv CherryPy-3.2.4 srs/trunk/objs/
RUN     cd srs/trunk/ && ./configure && make