FROM jsurf/rpi-raspbian

RUN apt-get update \ 
    && apt-get upgrade -y \
    && apt-get install -y \
    	curl \
    	git \
    	iproute2 \
    	python-pcapy \
    	schedtool
RUN git clone https://github.com/stamparm/maltrail.git /maltrail
RUN python /maltrail/core/update.py

WORKDIR /maltrail
VOLUME /var/log/maltrail

COPY maltrail.conf /maltrail/maltrail.conf
COPY run-sensor.sh /maltrail/run-sensor.sh
