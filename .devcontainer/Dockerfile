ARG PYTHON_VERSION="3.10.8-slim"
FROM python:${PYTHON_VERSION}

# Install necessary packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install -y gcc libgmp3-dev curl git zsh \
    && apt-get clean

# Copy Powerlevel10k configuration
COPY .p10k.zsh /root/.p10k.zsh

# Install Oh My Zsh and Powerlevel10k
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k \
    && echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >> ~/.zshrc \
    && echo 'source ~/.p10k.zsh' >> ~/.zshrc

WORKDIR /app

# Install Cairo and other Python dependencies
ARG CAIRO_VERSION
RUN pip3 install ecdsa fastecdsa sympy pylint cairo-lang==${CAIRO_VERSION}

# Set StarkNet network environment variable
ENV STARKNET_NETWORK alpha-goerli

# Install and initialize Nile
RUN pip install cairo-nile \
    && nile init

# Install additional tools for StarkNet development
RUN pip install starknet-devnet starknet.py

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
