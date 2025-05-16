FROM --platform=linux/arm/v7 python:3.8-slim-buster

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# Install OS dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libgl1-mesa-dev \
    libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev \
    libportmidi-dev libswscale-dev libavformat-dev libavcodec-dev \
    libffi-dev zlib1g-dev libjpeg-dev libfreetype6-dev libbz2-dev \
    libgstreamer1.0-0 libgstreamer-plugins-base1.0-dev \
    gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-tools \
    libmtdev-dev libusb-1.0-0 libudev-dev \
    tk-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip safely
RUN python3 -m pip install --upgrade pip setuptools wheel

# Install Kivy dependencies
RUN pip install cython==0.29.36
RUN pip install kivy==2.2.1

CMD ["python3"]
