FROM golang:1.13
RUN apt-get update && apt-get install -y unzip cmake
RUN apt-get update && apt-get install -y build-essential
RUN apt-get update && apt-get install -y qt5-default libvtk6-dev
# https://github.com/janza/docker-python3-opencv/issues/16
RUN apt-get install -y python-dev python-tk python-numpy python3-dev python3-tk python3-numpy python3-pip
RUN git clone https://github.com/jasperproject/jasper-client.git jasper && chmod +x jasper/jasper.py && pip3 install --upgrade setuptools && pip3 install -r jasper/client/requirements.txt
RUN apt-get update && apt-get install -y zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libopenexr-dev libgdal-dev
RUN apt-get update && apt-get install -y libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev
RUN apt-get update && apt-get install -y libtbb-dev libeigen3-dev
RUN apt-get update && apt-get install -y doxygen
RUN apt-get update && apt-get install -y wget
ENV OPENCV_VERSION=4.1.0
RUN mkdir /scripts /app
ADD opencv_install.sh /scripts/opencv_install.sh
RUN /bin/bash /scripts/opencv_install.sh
ENV CGO_CPPFLAGS="-I/usr/local/include"
ENV CGO_LDFLAGS="-L/usr/local/lib -lopencv_core -lopencv_face -lopencv_videoio -lopencv_imgproc -lopencv_highgui -lopencv_imgcodecs -lopencv_objdetect -lopencv_features2d -lopencv_video -lopencv_dnn -lopencv_xfeatures2d"
WORKDIR /app