FROM arm32v7/ubuntu

RUN set +x \
  && apt-get -qq -y update \
  && apt-get -qq -y upgrade \
  && apt-get -qq -y --no-install-recommends install wget python-pip python-dev python-setuptools python-virtualenv git libyaml-dev build-essential \
  && apt clean \
  && rm -rf /var/lib/apt/lists/* \
  && set -x 

ENV \
  HOME=/home/pi/OctoPrint

RUN set +x \
  && useradd pi \
  && usermod -a -G tty pi \
  && usermod -a -G dialout pi \
  && mkdir -p ${HOME} \
  && cd ${HOME} \
  && pip install pip --upgrade \
  && virtualenv venv \
  && source venv/bin/activate \
  && pip install pip --upgrade \
  && pip install octoprint \
  && wget https://github.com/foosel/OctoPrint/raw/master/scripts/octoprint.init && mv octoprint.init /etc/init.d/octoprint \
  && wget https://github.com/foosel/OctoPrint/raw/master/scripts/octoprint.default && mv octoprint.default /etc/default/octoprint \
  && chmod +x /etc/init.d/octoprint \
  && update-rc.d octoprint defaults \
  && set -x

ADD ./start.sh /root/

RUN chmod +x /root/start.sh

EXPOSE 5000

VOLUME /home/pi/Octoprint

CMD [ "/root/start.sh" ]

#/etc/default/octoprint:

#DAEMON=/home/pi/OctoPrint/venv/bin/octoprint

