FROM ubuntu:22.04

MAINTAINER hfkroes

# Configuring TZ to avoid halting R installation
ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Installing necessary dependencies
RUN  apt-get update \
  && apt-get install -y apt-utils \
  && apt-get install -y wget \
  && apt-get install -y openssl \
  && apt-get install -y curl \
  && apt-get install -y libcurl4 \
  && apt-get install -y gfortran \
  && apt-get install -y libblas-dev \
  && apt-get install -y liblapack-dev \
  && apt-get install -y cmake

# Installing R v4.1.2
RUN apt install -y r-base=4.1.2-1ubuntu2

# Installing Bioconductor v3.14
RUN R -e "install.packages('BiocManager',dependencies=TRUE, repos='http://cran.rstudio.com/')" \
  && R -e "BiocManager::install(version = '3.14')" \
  && R -e "BiocManager::install('Rsubread', version=' 2.14.2')"

# Installing other necessary R packages
RUN R -e "install.packages('ggplot2', version='3.4.0', dependencies=TRUE, repos='http://cran.rstudio.com/')"