#
# HTTPbin Dockerfile
#
FROM ubuntu:14.04

MAINTAINER Nikolay Golub <nikolay.v.golub@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && apt-get install --no-install-recommends python-pip build-essential python-dev -y && \
  pip install gunicorn httpbin && \
  echo '#!/bin/bash' > run.sh && \
  echo 'exec gunicorn --bind=0.0.0.0:8000 httpbin:app' >> run.sh && \
  chmod +x run.sh && \
  apt-get remove --purge build-essential python-dev -y && \
  apt-get autoremove -y && \
  rm -rf /var/lib/apt/lists/*
  
EXPOSE 8000
  
CMD ["./run.sh"]
