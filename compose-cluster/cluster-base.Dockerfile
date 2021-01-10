# 1. Cluster base image

# 1. using Java8 for spark
ARG debian_buster_image_tag=8-jre-slim
FROM openjdk:${debian_buster_image_tag}



ARG shared_workspace=/opt/workspace

# 2. install python3 for pyspark
RUN mkdir -p ${shared_workspace} && \
    apt-get update -y && \
    apt-get install -y python3 && \
    ln -s /usr/bin/python3 /usr/bin/python && \
    rm -rf /var/lib/apt/lists/*


# create shared volume to simulate HDFS
ENV SHARED_WORKSPACE=${shared_workspace}
VOLUME ${shared_workspace} 
CMD ["bash"]