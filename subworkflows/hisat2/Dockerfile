FROM continuumio/miniconda3:4.12.0

MAINTAINER hfkroes

RUN apt-get update && apt-get install -y \
  libncurses-dev \
  libbz2-dev \
  liblzma-dev \
  zlib1g-dev \
  wget \
  make \
  gcc

#Installing HISAT2 v2.2.1
RUN conda install -c bioconda hisat2=2.2.1

#Installing SAMtools v1.17
RUN wget https://github.com/samtools/samtools/releases/download/1.17/samtools-1.17.tar.bz2 \
  && tar xvjf samtools-1.17.tar.bz2 \
  && cd samtools-1.17 \
  && chmod +x configure \
  && ./configure \
  && make \
  && chmod +x version.sh \
  && make install

# Adding SAMtools to path
ENV PATH=${PATH}:/samtools-1.17
