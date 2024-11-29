# Use an appropriate base image
FROM ubuntu:latest

# Set environment variable to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Install tzdata and other required packages
RUN apt update && apt upgrade -y \
	&& apt-get install -y tzdata \
	&& ln -fs /usr/share/zoneinfo/Europe/London /etc/localtime \
	&& dpkg-reconfigure --frontend noninteractive tzdata \
	&& apt install -y bc bison build-essential cpio curl dwarves flex git jq kmod libelf-dev libssl-dev pahole python3 rsync sudo

# Clean up to reduce the image size
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash -u 1001 github \
	&& printf '%s' 'github ALL=(ALL) NOPASSWD: ALL' > /etc/sudoers.d/github

USER github

WORKDIR /home/github
