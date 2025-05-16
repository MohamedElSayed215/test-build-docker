FROM --platform=linux/arm/v7 python:3.8-slim-buster

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# 1. Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libgl1-mesa-dev \
    libgles2-mesa-dev \
    libsdl2-dev \
    libsdl2-image-dev \
    libsdl2-mixer-dev \
    libsdl2-ttf-dev \
    libportmidi-dev \
    libswscale-dev \
    libavformat-dev \
    libavcodec-dev \
    zlib1g-dev \
    libgstreamer1.0-dev \
    gstreamer1.0-plugins-base \
    gstreamer1.0-plugins-good \
    gstreamer1.0-tools \
    libmtdev-dev \
    libjpeg-dev \
    libfreetype6-dev \
    libpng-dev \
    libffi-dev \
    libpulse-dev \
    libgl-dev \
    libegl-dev \
    pkg-config \
    python3-dev \
    tcl-dev tk-dev \
    libx11-dev \
    git \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# 2. Upgrade pip and install Python dependencies
RUN pip install --upgrade pip setuptools wheel cython==0.29.36

# 3. Install Kivy (base - بدون deps زي garden)
RUN pip install kivy[base]==2.2.1

# 4. Verify tkinter (part of python3-dev + tk-dev)
RUN python3 -c "import tkinter"

CMD ["python3"]
