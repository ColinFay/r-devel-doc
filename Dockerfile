FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

# From https://github.com/r-devel/r-svn/blob/master/.github/workflows/build-svn.yaml#L29
RUN apt-get update -y && apt-get install -y gcc clang wget locales git rsync \
    gfortran xvfb autoconf pkg-config texinfo texlive-latex-extra \
    texlive-fonts-recommended tk8.6-dev libcurl4-openssl-dev \
    libblas-dev libbz2-dev libicu-dev libjpeg-dev liblapack-dev \
    liblzma-dev libncurses5-dev libpcre2-dev libpng-dev \
    libreadline-dev libxt-dev

RUN localedef -i en_US -f UTF-8 en_US.UTF-8

RUN mkdir /rsourcetools && touch /rsourcetools/.here

COPY tools.sh /rsourcetools

COPY build.sh /rsourcetools

