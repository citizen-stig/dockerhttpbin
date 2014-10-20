FROM ubuntu:latest
MAINTAINER Nikolay Golub <nikolay.v.golub@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN \
  apt-get update && apt-get install --no-install-recommends python-pip -y && \
  pip install gunicorn httpbin && \
  echo '#!/bin/bash' > run.sh && \
  echo 'gunicorn --bind=0.0.0.0:8000 httpbin:app' >> run.sh && \
  chmod +x run.sh
  
EXPOSE 8000
  
CMD ["./run.sh"]
