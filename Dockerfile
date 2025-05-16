# Use a Raspberry Pi 3 compatible base image (Debian Buster or Bullseye)
FROM --platform=linux/arm/v7 python:3.8-slim-buster

# Set environment variables to avoid warnings/errors during builds
ENV DEBIAN_FRONTEND=noninteractive

# Update and install system dependencies for Kivy, Python dev, Tkinter, build tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    git \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
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
    tcl-dev \
    tk-dev \
    libx11-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Upgrade pip, setuptools, wheel
RUN pip3 install --upgrade pip setuptools wheel

# Install cython pinned version and Kivy pinned version (2.2.1 is stable)
RUN pip3 install cython==0.29.36
RUN pip3 install kivy==2.2.1

# Optional: Add your custom Tkinter or any other setup here

# Default command to run python interactive shell
CMD ["python3"]
