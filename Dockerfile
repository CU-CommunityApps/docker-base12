FROM ubuntu:12.04

# Install.
RUN \
  apt-get update && apt-get install -y \
    build-essential \ 
    curl \
    git \
    unzip \
    vim \ 
    wget \
    ruby1.9.3 && \
  rm -rf /var/lib/apt/lists/*

RUN rm /etc/localtime 
RUN ln -s /usr/share/zoneinfo/America/New_York /etc/localtime

RUN echo "gem: --no-ri --no-rdoc" > ~/.gemrc
RUN gem install puppet -v 3.7.5 && \
    gem install librarian-puppet -v 2.1.0

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD ["bash"]
