FROM python:3.7.13

WORKDIR /app

RUN apt-get -y update  && apt-get install -y \
  python3-dev \
  apt-utils \
  git \
  uvicorn \
  python-dev \
  build-essential \
&& rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade setuptools

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

RUN mkdir -p /root/.torch/models && wget -O /root/.torch/models/vgg16_bn-6c64b313.pth https://download.pytorch.org/models/vgg16_bn-6c64b313.pth && wget -O /root/.torch/models/resnet34-333f7ec4.pth https://download.pytorch.org/models/resnet34-333f7ec4.pth && mkdir /app/models && wget /app/models https://data.deepai.org/deoldify/ColorizeArtistic_gen.pth && wget -O /app/models https://data.deepai.org/deoldify/ColorizeVideo_gen.pth

CMD uvicorn app:app --reload --host 0.0.0.0 --port 8000