FROM python:3.7.13

WORKDIR /app

RUN apt-get -y update  && apt-get install -y \
  python3-dev \
  apt-utils \
  git \
  python3-opencv \
  uvicorn \
  python-dev \
  build-essential \ 
  wget \
&& rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade setuptools

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . /app

RUN mkdir -p /root/.torch/models 

ADD https://download.pytorch.org/models/vgg16_bn-6c64b313.pth /root/.torch/models/ 

ADD https://download.pytorch.org/models/resnet34-333f7ec4.pth /root/.torch/models/ 

RUN mkdir -p ./models

CMD uvicorn app:app --reload --host 0.0.0.0 --port 8000