FROM nvidia/cuda:10.1-cudnn7-runtime-ubuntu18.04

# add our user and group first to mak2e sure their IDs get assigned consistently, regardless of whatever dependencies get adde
RUN groupadd -r richard && useradd -r -g richard richard
RUN usermod -u 1000 richard
RUN groupmod -g 1000 richard
ENV DEBIAN_FRONTEND=noninteractive
ENV LANGUAGE C.UTF-8
ENV LC_ALL C.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo '$TZ' > /etc/timezone
RUN apt-get update
RUN apt-get install gosu
RUN apt-get install -y libbz2-dev
RUN apt-get install -y cython
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y default-libmysqlclient-dev
RUN apt-get install -y default-mysql-client
RUN apt-get install -y vim
RUN apt-get install -y libssl-dev
RUN apt-get install -y libopencv-dev
RUN apt-get install -y net-tools
COPY pip.conf /root/.pip/
RUN pip3 install Django==2.1
RUN pip3 install uwsgi
RUN pip3 install captcha
RUN pip3 install django-simple-captcha
RUN pip3 install django-cors-headers
RUN pip3 install pycryptodome
RUN pip3 install oss2
RUN pip3 install mysqlclient
RUN pip3 install numpy
RUN pip3 install grpcio
RUN pip3 install pymongo
RUN pip3 install protobuf
RUN pip3 install pymysql
RUN pip3 install DBUtils
RUN pip3 install baidu-aip
RUN pip3 install Cython
RUN pip3 install ConcurrentLogHandler
RUN pip3 install scipy
RUN pip3 install mxnet
RUN pip3 install mxnet-cu101
RUN pip3 install opencv-python
RUN pip3 install sklearn
RUN pip3 install easydict
RUN pip3 install scikit-image
RUN pip3 install pillow
RUN pip3 install kazoo
RUN apt-get install telnet
