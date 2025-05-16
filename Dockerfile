FROM balenalib/raspberrypi3-debian-python:3.8-buster-build

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

# Install dependencies
RUN apt-get update && apt-get install -y \
    python3-dev \
    build-essential \
    libgl1-mesa-dev \
    libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev \
    libportmidi-dev libswscale-dev libavformat-dev libavcodec-dev \
    zlib1g-dev libffi-dev libsqlite3-dev libjpeg-dev \
    tk-dev \
    gstreamer1.0-tools gstreamer1.0-plugins-base \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python packages
RUN pip3 install --no-cache-dir cython==0.29.36 kivy==2.2.1

# Optional: Copy and apply patch for custom Tkinter
# COPY custom-tkinter.patch /tmp/
# RUN patch -p1 < /tmp/custom-tkinter.patch

CMD ["python3"]
