FROM continuumio/miniconda3
RUN apt-get update && apt-get install -y gcc g++ make
WORKDIR /workspace
COPY environment.yaml /workspace/environment.yaml
RUN conda env create -f environment.yaml

# 1. 创建镜像
# docker build --rm -f "Dockerfile" -t ditto:latest "." 

# 2. 运行容器
# docker run --name ditto --gpus all -v .:/workspace -it ditto:latest /bin/bash
# conda activate ditto

# 3.进入容器
# docker exec -it ditto /bin/bash
# conda activate ditto

# 4.推理
# python inference.py \
#     --data_root "./checkpoints/ditto_trt_Ampere_Plus" \
#     --cfg_pkl "./checkpoints/ditto_cfg/v0.4_hubert_cfg_trt.pkl" \
#     --audio_path "./example/audio.wav" \
#     --source_path "./tmp/boy.png" \
#     --output_path "./tmp/boy.mp4" 