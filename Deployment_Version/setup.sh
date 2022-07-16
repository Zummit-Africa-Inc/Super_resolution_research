# Update and install requirements
# sudo apt-get update
# sudo apt install -y python3-pip nginx
# sudo apt install -y uvicorn
# # Copy the configuration file to the nginx enabled sites folder
# sudo cp -R fastapi_setup /etc/nginx/sites-enabled/
# sudo service nginx restart
sudo git clone https://github.com/Nneji123/DeOldify.git ~/DeOldify
cd ~/DeOldify
sudo pip3 install -r requirements.txt
sudo wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
sudo tar -xvzf ngrok-v3-stable-linux-amd64.tgz
sudo ngrok authtoken 29vr8YhWZ9CDHrUq2kr0CpUA0e8_6ik4hU5GjJZeAYagTH5i4
sudo mkdir -p /root/.torch/models
sudo mkdir -p ~/DeOldify/models

sudo wget -O /root/.torch/models/vgg16_bn-6c64b313.pth https://download.pytorch.org/models/vgg16_bn-6c64b313.pth

sudo wget -O /root/.torch/models/resnet34-333f7ec4.pth https://download.pytorch.org/models/resnet34-333f7ec4.pth

sudo wget -O ~/DeOldify/models/ColorizeArtistic_gen.pth https://data.deepai.org/deoldify/ColorizeArtistic_gen.pth
sudo wget -O ~/DeOldify/models/ColorizeVideo_gen.pth https://data.deepai.org/deoldify/ColorizeVideo_gen.pth
#cp -R ~/Super_resolution_research/app.py ~/DeOldify 

uvicorn app:app --reload 

