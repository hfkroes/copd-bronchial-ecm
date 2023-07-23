FROM ubuntu:22.04

MAINTAINER hfkroes

# Installing necessary dependencies
RUN  apt-get update \
  && apt-get install -y wget \
  && apt-get install -y unzip

# Installing SRA Toolkit v3.0.2
RUN mkdir sra-toolkit \
	&& cd sra-toolkit \
	&& wget --output-document sratoolkit.tar.gz https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/3.0.2/sratoolkit.3.0.2-ubuntu64.tar.gz \
	&& tar -vxzf sratoolkit.tar.gz -C /sra-toolkit \
	&& rm sratoolkit.tar.gz

# Adding tool to path
ENV PATH=${PATH}:/sra-toolkit/sratoolkit.3.0.2-ubuntu64/bin