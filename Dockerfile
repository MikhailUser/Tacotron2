# Базовый образ на торче
FROM pytorch/pytorch:nightly-devel-cuda10.0-cudnn7

RUN conda install python==3.7.13
WORKDIR /data
# Копируем гит в рабочую директорию
RUN git clone https://github.com/MikhailUser/Tacotron2.git 

COPY ./wavs/ wavs/
# Устанавливаем зависимостей
RUN apt-get update -y
RUN pip install numpy==1.16.0 
RUN pip install scipy==1.1.0 
RUN pip install matplotlib==3.2.2
RUN pip install librosa==0.6.0 
RUN pip install tensorflow==1.15.2
RUN pip install protobuf==3.17.3
RUN pip install tensorboard
RUN pip install inflect==0.2.5 
RUN pip install Unidecode==1.0.22 
RUN pip install numba==0.48
RUN pip install future
RUN pip install pillow
#torch
#RUN conda install pytorch torchvision torchaudio cudatoolkit=10.2 -c pytorch
RUN pip3 install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu113

#apex
RUN git clone https://github.com/NVIDIA/apex
WORKDIR /data/apex 
RUN pip install -v --disable-pip-version-check --no-cache-dir ./

VOLUME /data/outdir
VOLUME /data/logdir
WORKDIR /data/Tacotron2
CMD  ["python", "train.py", "--output_directory=outdir", "--log_directory=logdir"]
