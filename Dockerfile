#FROM pytorch/pytorch:1.13.1-cuda11.6-cudnn8-runtime
FROM scratch

COPY --from=python:3.8 / /

RUN apt-get update && apt-get install -y git ffmpeg libgl1 libglib2.0-dev libsm6 libxext6

WORKDIR /content
RUN git clone https://github.com/NaJeongMo/Colaboratory-Notebook-for-Ultimate-Vocal-Remover.git VocalRemover5-COLAB_arch

WORKDIR /content/VocalRemover5-COLAB_arch

RUN pip install pathvalidate yt_dlp samplerate librosa==0.8.0 resampy==0.2.2 numba==0.48.0 numpy==1.23.0
RUN pip install torch==1.13.1 tqdm==4.30 opencv_python==4.6.0.66

RUN wget -i model_list && \
for z in $(ls | grep zip); do unzip $z; done && \
rm *.zip
