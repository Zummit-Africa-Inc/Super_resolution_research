FROM python:3.9-slim-buster

WORKDIR /app

RUN apt-get -y update  && apt-get install -y \
  python3-dev \
  apt-utils \
  python-dev \
  build-essential \
&& rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade setuptools 
    

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

CMD web: uvicorn app:app --host=0.0.0.0 --port=${PORT:-5000}
