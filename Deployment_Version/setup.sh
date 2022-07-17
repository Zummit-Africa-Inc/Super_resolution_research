#!/bin/sh
git clone https://github.com/Nneji123/DeOldify.git ~/DeOldify
cd ~/DeOldify
pip3 install -r requirements.txt
mkdir -p /root/.torch/models
mkdir -p ~/DeOldify/models

wget -O /root/.torch/models/vgg16_bn-6c64b313.pth https://download.pytorch.org/models/vgg16_bn-6c64b313.pth

wget -O /root/.torch/models/resnet34-333f7ec4.pth https://download.pytorch.org/models/resnet34-333f7ec4.pth


