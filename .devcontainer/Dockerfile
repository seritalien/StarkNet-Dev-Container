ARG PYTHON_VERSION="3.7.11-slim"
FROM python:${PYTHON_VERSION}
RUN  apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get install gcc libgmp3-dev curl git zsh -y \
    #&& apt-get update && export DEBIAN_FRONTEND=noninteractive \
    #&& apt-get -y install --no-install-recommends gcc libgmp3-dev \
    && apt-get clean

COPY .p10k.zsh /root/.p10k.zsh
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k \
    && echo 'source ~/.p10k.zsh' >> ~/.zshrc \
    && echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

WORKDIR /app

# cairo prerequisites
ARG CAIRO_VERSION
RUN pip3 install ecdsa fastecdsa sympy pylint cairo-lang 
#==${CAIRO_VERSION}

ENV STARKNET_NETWORK alpha-goerli 

# install and init cairo-nile
RUN pip install cairo-nile
RUN nile init
