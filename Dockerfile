FROM phusion/baseimage:18.04-1.0.0

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-get update && apt-get install -y --no-install-recommends\
	build-essential python-dev curl python-pycurl python-pip \
	python-numpy python-opencv webp libpng-dev libtiff-dev libjpeg-dev libjpeg-progs \
	libdc1394-22-dev libdc1394-22 libdc1394-utils \
	gifsicle libgif-dev \
	&& rm -rf /var/lib/apt/lists/*

RUN pip install -U setuptools
RUN pip install thumbor

EXPOSE 8880

ENTRYPOINT ["/usr/local/bin/thumbor"]

CMD ["--port=8880", "--conf=/root/thumbor/thumbor.conf", "--log-level=debug"]
