# We are basing our builder image on openshift base-centos7 image
FROM openshift/jenkins-slave-base-centos7

# Inform users who's the maintainer of this builder image
MAINTAINER Masatoshi Hayashi <literalice@monochromeroad.com>

# Install the required software
ADD daftaupe-hugo-epel-7.repo /etc/yum.repos.d/

RUN yum -y install hugo && \
    yum -y clean all && \

RUN hugo version

# Set the default user for the image, the user itself was created in the base image
USER 1001

