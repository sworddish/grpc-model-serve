# Please consult the README if you need help in selecting a base image
FROM python:3.8.13-buster

ENV LANG=C.UTF-8 \
    DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/app

RUN apt-get update

RUN useradd -s /bin/bash -m vscode \
    && groupadd docker \
    && usermod -aG docker vscode

USER vscode

RUN echo 'alias ls="ls -halp"' >> ~/.bashrc

# RUN apt-get install libgl1 -y

# copy application files into the container image
# NOTE: to avoid overly large container size, only copy the files actually needed by
#       explicitly specifying the needed files with the `COPY` command or adjusting
#       the `.dockerignore` file to ignore unneeded files
# Create the application working directory



# environment variable to specify model server port
ENV PSC_MODEL_PORT=45000 \
    PATH=${PATH}:/home/vscode/.local/bin

# ENV PIP_ROOT_USER_ACTION=ignore

ARG VERSION=0.1
LABEL version ="${VERSION}"

ADD requirements.txt ./
RUN pip config set global.extra-index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install --no-cache-dir --upgrade pip && \
    pip install -r requirements.txt --force-reinstall  --no-deps --no-cache-dir

COPY protos ./protos
COPY scripts ./scripts
COPY grpc_model ./grpc_model
COPY model_lib ./model_lib
COPY asset_bundle/0.1.0 ./asset_bundle/0.1.0
COPY dog.jpg ./dog.jpg

ENTRYPOINT ["python", "-m", "grpc_model.src.model_server"]
