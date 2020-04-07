FROM ubuntu

RUN set +x \
  && apt-get -qq -y update \
  && apt-get -qq -y upgrade \
  && apt-get -qq -y --no-install-recommends install python-pip python-dev python-setuptools git libyaml-dev build-essential wget \
  && apt clean \
  && rm -rf /var/lib/apt/lists/* \
  && set -x 

ENV \
  HOME=/home/pi/OctoPrint

RUN set +x \
  && pip install pip --upgrade \
  && pip install octoprint \
  && set -x

EXPOSE 5000

VOLUME /home/pi/Octoprint

CMD [ "/usr/local/bin/octoprint serve --iknowwhatiamdoing" ]