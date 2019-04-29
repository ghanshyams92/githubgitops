# base image ubuntu
FROM inmbzp7148.in.dst.ibm.com:5000/ubuntu:69

MAINTAINER Ghanshyam <gsaini05@in.ibm.com>
USER root
ENV DEBIAN_FRONTEND noninteractive

# add script which start vnc session
ADD startup.sh /startup.sh
ADD geckodriver /usr/local/sbin/geckodriver
ADD geckodriver /usr/sbin/geckodriver
ADD geckodriver /usr/local/bin/geckodriver
ADD geckodriver /usr/bin/geckodriver
ADD geckodriver /sbin/geckodriver
ADD geckodriver /bin/geckodriver
ADD samplecase.py /home/selenium/samplecase.py
# Update package and install required packages like python and xvnc
RUN apt-get update -y && apt-get clean && apt-get install -y git wget python python-numpy x11vnc net-tools apt-file && \
    apt-file update && apt-get clean && apt-get install -y unzip firefox openbox geany menu && apt-get install -y python-pip && pip install  selenium

RUN wget -O /opt/noVNC.zip http://inmbzp7148.in.dst.ibm.com:8081/repository/installables/noVNC.zip && cd /opt && unzip noVNC.zip && rm -rf noVNC.zip

# set the permission for startup script
RUN cd /opt && \
    chmod 0755 /startup.sh && \
    apt-get autoclean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

# Install java, python, firefix and upgrading packages
RUN apt-get update -y && apt-get install software-properties-common -y && apt-get install python3-software-properties -y &&  apt-get install python-software-properties -y && add-apt-repository ppa:openjdk-r/ppa && apt-get update -y && apt-get install openjdk-8-jdk -y && update-alternatives --config java && update-alternatives --config javac 

RUN apt-get clean && apt-get update &&  apt-get install firefox unzip xvfb -y

# Set environment for VNC
ENV DISPLAY=localhost:1

RUN mkdir -p /var/devopscommander/

#Copying selenium scripts for application into container
RUN wget -O /var/devopscommander/test-1.zip http://inmbzp7148.in.dst.ibm.com:8081/repository/installables/test-1.zip

# copying selenium web driver 
RUN wget -O /geckodriver http://inmbzp7148.in.dst.ibm.com:8081/repository/installables/geckodriver

# Coping selenium test cases
RUN wget -O /MultipleTests.jar http://inmbzp7148.in.dst.ibm.com:8081/repository/installables/MultipleTests.jar 

ADD filebeat-6.2.1-linux-x86_64 /filebeat-6.2.1-linux-x86_64
ADD node_exporter-0.15.2.linux-amd64 /opt/node_exporter-0.15.2.linux-amd64
RUN mv /opt/node_exporter-0.15.2.linux-amd64 /opt/node_exporter/
ADD node_exporter.sh /opt/node_exporter/node_exporter.sh
ADD node_exporter /etc/init.d/node_exporter

# Create slenium user and set permission for below files and scripts 
RUN mkdir -p /home/selenium
RUN groupadd -r selenium --gid=999 && useradd -r -g selenium --uid=999 selenium && \
 chown -R selenium /MultipleTests.jar && chmod 2777 /MultipleTests.jar && \
 chown -R selenium /geckodriver && chmod 2777 /geckodriver && \
 chown -R selenium /var/devopscommander/test-1.zip && chmod 2777 /var/devopscommander/test-1.zip && \
 chown -R selenium /startup.sh && chmod 2777 /startup.sh && \
 chown -R selenium /opt/noVNC && chmod 2777 /opt/noVNC && \
 chown -R selenium:selenium /usr/bin/firefox && chmod 2777 /usr/bin/firefox && \
 chown -R selenium:selenium /usr/lib/firefox/ &&  chmod 2777 /usr/lib/firefox/ && \
 chown -R selenium:selenium /usr/share/doc/firefox/* &&  chmod 2777 /usr/share/doc/firefox/*  && \
 chown -R selenium:selenium /home/selenium && chmod 2777 /home/selenium  &&\
 chown -R selenium /usr/local/sbin/geckodriver && chmod 2777 /usr/local/sbin/geckodriver && \
 chown -R selenium /usr/local/bin/geckodriver && chmod 2777 /usr/local/bin/geckodriver && \
 chown -R selenium /usr/sbin/geckodriver && chmod 2777 /usr/sbin/geckodriver && \
 chown -R selenium /usr/bin/geckodriver && chmod 2777 /usr/bin/geckodriver && \
 chown -R selenium  /sbin/geckodriver && chmod 2777 /sbin/geckodriver && \
 chown -R selenium /bin/geckodriver && chmod 2777 /bin/geckodriver && \
 chown -R selenium:selenium /home/selenium/samplecase.py && chmod 2777 /home/selenium/samplecase.py 
RUN chown -R selenium:selenium /etc/init.d/node_exporter && chmod -R 2777 /etc/init.d/node_exporter
RUN chown -R selenium:selenium /opt/node_exporter/node_exporter.sh && chmod 2777 /opt/node_exporter/node_exporter.sh  

# Create User selenium
#USER selenium

CMD /startup.sh

# expose the port
EXPOSE 6080 9100 5044

