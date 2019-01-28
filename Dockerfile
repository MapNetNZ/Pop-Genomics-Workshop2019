
FROM ubuntu

MAINTAINER John McCallum cfljam@users.noreply.github.com

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get -y install gcc  && \
    rm -rf /var/lib/apt/lists/*




#RUN conda create -n PopGenv python=3.6 gcc
#RUN echo "conda  activate PopGenv" > ~/.bashrc
#RUN echo ". /opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc
#RUN . ~/.bashrc
#ENV PATH /opt/conda/envs/env/bin:$PATH
#RUN conda activate PopGenv
#RUN conda install -y -c anaconda gcc
#RUN conda install -y -c bioconda/label/cf201901 angsd
