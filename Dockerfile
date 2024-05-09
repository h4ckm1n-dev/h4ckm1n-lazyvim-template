# Use the latest Ubuntu image as the base
FROM ubuntu:22.04

# Set a maintainer label
LABEL maintainer="your-email@example.com"

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    git \
    curl \
    neovim \
    python3-pip \
    nodejs \
    npm \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Python Neovim client (optional, remove if not using Python plugins)
RUN pip3 install neovim pynvim

# Set the working directory for subsequent commands
WORKDIR /root

# Clone your LazyVim configuration into the Neovim config directory
RUN mkdir -p ~/.config/nvim && \
    git clone https://github.com/h4ckm1n-dev/h4ckm1n-nvim.git ~/.config/nvim

# Run LazyVim installer to set up plugins and configuration
RUN curl -s https://raw.githubusercontent.com/LazyVim/LazyVim/main/utils/installer/install.sh | bash

# Set the entrypoint to Neovim, making the container start Neovim by default
ENTRYPOINT ["nvim"]

# The container runs Neovim by default when started
CMD ["+LazyUpdate", "+qa"]
