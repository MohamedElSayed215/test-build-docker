FROM --platform=linux/arm/v7 python:3.8-slim-buster

ENV DEBIAN_FRONTEND=noninteractive

# تحديث وتثبيت الحزم الأساسية
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python3-dev \
    python3-pip \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# تحديث pip وتثبيت مكتبة paho-mqtt
RUN pip3 install --upgrade pip setuptools wheel
RUN pip3 install paho-mqtt

CMD ["python3"]
