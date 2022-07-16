#!/bin/sh
service nginx restart
git clone https://github.com/Nneji123/DeOldify.git ~/DeOldify
cp -R fastapi_setup /etc/nginx/sites-enabled/
cd ~/DeOldify
pip3 install -r requirements.txt
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
tar -xvzf ngrok-v3-stable-linux-amd64.tgz
ngrok authtoken 29vr8YhWZ9CDHrUq2kr0CpUA0e8_6ik4hU5GjJZeAYagTH5i4
mkdir -p /root/.torch/models
mkdir -p ~/DeOldify/models

wget -O /root/.torch/models/vgg16_bn-6c64b313.pth https://download.pytorch.org/models/vgg16_bn-6c64b313.pth

wget -O /root/.torch/models/resnet34-333f7ec4.pth https://download.pytorch.org/models/resnet34-333f7ec4.pth

wget -O ~/DeOldify/models/ColorizeArtistic_gen.pth https://data.deepai.org/deoldify/ColorizeArtistic_gen.pth
wget -O ~/DeOldify/models/ColorizeVideo_gen.pth https://data.deepai.org/deoldify/ColorizeVideo_gen.pth
#cp -R ~/Super_resolution_research/app.py ~/DeOldify 

#kill -9 $(lsof -t -i:80)
#service nginx restart
# Run the application with nohup so the application runs as a background process

