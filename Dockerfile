FROM ubuntu

RUN apt-get update -qq && apt-get upgrade -y
RUN apt-get install -y software-properties-common build-essential \
    git \
    curl wget \
    zsh \
    tmux \
    python3 \
    python3-dev \
    python3-pip \
    autojump

RUN curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get install -y nodejs

RUN add-apt-repository ppa:neovim-ppa/stable && \
    apt-get update && \
    apt-get install -y neovim

RUN pip3 install neovim

RUN git clone https://github.com/rdlester/dotfiles && \
    cd dotfiles && \
    ./link.sh && echo 'Refresh'

RUN mkdir ~/.vim && mkdir ~/.config && \
    ln -s ~/.vim ~/.config/nvim && \
    ln -s ~/.vimrc ~/.config/nvim/init.vim

RUN nvim +PlugInstall +qa

# RUN git clone https://github.com/zplug/zplug ~/.zplug && \
    # zsh -c "source ~/.zshrc && zplug install"

# VOLUME . /shared
CMD zsh
