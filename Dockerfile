# Base image
FROM ubuntu:18.04

# Set ENV
ENV TZ=Asia
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone


# Install all the dependencies
RUN apt-get update && apt-get install -y \
    wget \
    build-essential \
    cmake \
    git \
    unzip \
    pkg-config \
    python-opencv \
    libopencv-dev \
    ffmpeg \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev

RUN apt-get update && apt-get install -y \
    # libjasper-dev \
    libgtk2.0-dev \
    python-numpy \
    python-pycurl \
    libatlas-base-dev \
    gfortran \
    webp \
    python-opencv \
    qt5-default \
    libvtk6-dev \
    zlib1g-dev


# Get and build opencv
RUN git clone https://github.com/opencv/opencv.git && \
    mkdir -p build && \
    cd build && \
    cmake ../opencv && \
    make -j4 && \
    make install

RUN apt-get install -y libgtk2.0-dev
RUN pip uninstall p\
RUN echo 'Successfully built'

WORKDIR /usr/app
COPY . .

CMD ["python", "show_image.py"]