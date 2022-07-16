FROM python:3.7.13

WORKDIR /app

RUN apt-get -y update  && apt-get install -y \
  python3-dev \
  apt-utils \
  git \
  ngrok \
  uvicorn \
  python-dev \
  build-essential \
&& rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade setuptools

#COPY requirements.txt .

#RUN pip install -r requirements.txt

COPY . .

RUN chmod u+x /setup.sh

RUN /setup.sh