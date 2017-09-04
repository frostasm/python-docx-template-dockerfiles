# Dockerfiles for building images with LibreOffice and python-docx-template

FROM instructure/libreoffice:5.2
MAINTAINER Serhii Moroz <frost.asm@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN locale-gen en_US.UTF-8 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get update \
    && echo "Y" | apt-get install -y \
        mime-support \
        python3 \
        python3-setuptools \
        ca-certificates \
        --no-install-recommends \
    && easy_install3 pip \
    && pip3 install --no-cache-dir docxtpl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY  docx-template-render.py /usr/local/lib/python3.5/dist-packages/docxtpl/__main__.py

ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8



USER docker