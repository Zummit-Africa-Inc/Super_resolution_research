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

#COPY requirements.txt .

#RUN pip install -r requirements.txt

COPY . .

RUN chmod u+x setup.sh

RUN ./setup.sh

RUN mkdir /app/models && wget /app https://data.deepai.org/deoldify/ColorizeArtistic_gen.pth && wget -O /app/models https://data.deepai.org/deoldify/ColorizeVideo_gen.pth

CMD uvicorn app:app --reload --host 0.0.0.0 --port 8000