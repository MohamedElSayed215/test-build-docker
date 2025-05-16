FROM --platform=linux/arm/v7 python:3.8-slim-buster

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

RUN apt-get update && apt-get install -y \
    build-essential git pkg-config python3-dev \
    libgl1-mesa-dev libgles2-mesa-dev libgstreamer1.0-dev libmtdev-dev \
    xclip xsel pulseaudio libpulse-dev \
    libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev \
    libavformat-dev libavcodec-dev libswscale-dev libjpeg-dev \
    libfreetype6-dev zlib1g-dev libpng-dev libffi-dev \
    tk-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools wheel
RUN pip install Cython==0.29.36
RUN pip install git+https://github.com/kivy/kivy.git@2.2.1

CMD ["python3"]
