

sudo yum -y update

sudo yum -y install git

export CUDA_HOME=/opt/nvidia/cuda
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:${CUDA_HOME}/lib64:/opt/nvidia/cuda/extras/CUPTI/lib64"
export PATH=${CUDA_HOME}/bin:${PATH}


tar xzvf cudnn-7.5-linux-x64-v5.1.tgz
sudo cp cuda/include/cudnn.h /opt/nvidia/cuda/include
sudo cp cuda/lib64/libcudnn* /opt/nvidia/cuda/lib64
sudo chmod a+r /opt/nvidia/cuda/include/cudnn.h /opt/nvidia/cuda/lib64/libcudnn*

sudo yum -y install zlib-devel bzip2-devel openssl-devel readline-devel ncurses-devel sqlite-devel gdbm-devel db4-devel expat-devel libpcap-devel xz-devel pcre-devel
curl https://www.python.org/ftp/python/3.5.2/Python-3.5.2.tgz | tar xzvf -
cd Python-3.5.2/
./configure --prefix=/usr
make
sudo make install

export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.10.0-cp35-cp35m-linux_x86_64.whl
sudo pip3 install --upgrade $TF_BINARY_URL

#python3 -m tensorflow.models.image.mnist.convolutional

git clone https://github.com/openai/gym
cd gym
sudo pip3 install -e .
sudo pip3 install python-dateutil
sudo pip3 install scikit-image
sudo pip3 install scipy
sudo pip3 install matplotlib
sudo yum install libtiff-devel libjpeg-devel libzip-devel freetype-devel lcms2-devel libwebp-devel tcl-devel tk-devel cmake -y
sudo pip3 install gym[atari]
