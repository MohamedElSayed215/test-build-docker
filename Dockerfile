FROM --platform=linux/arm/v7 python:3.8-slim-buster

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# ✅ 1. Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    python3-dev \
    libgl1-mesa-dev \
    libgles2-mesa-dev \
    libgstreamer1.0-dev \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-tools \
    libmtdev-dev \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    libavformat-dev \
    libavcodec-dev \
    libswscale-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libpng-dev \
    zlib1g-dev \
    libffi-dev \
    libpulse-dev \
    pulseaudio \
    xclip xsel \
    tk-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ✅ 2. Upgrade pip and install cython
RUN pip install --upgrade pip setuptools wheel
RUN pip install cython==0.29.36

# ✅ 3. Install Kivy from GitHub (أفضل من PyPI للـ ARM)
RUN pip install git+https://github.com/kivy/kivy.git@2.2.1

CMD ["python3"]
