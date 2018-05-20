FROM ubuntu:18.04
MAINTAINER hrnrhty <hrnrhty@gmail.com>

RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    connect-proxy \
    curl \
    firefox \
    fonts-ipafont-gothic \
    fonts-ipafont-mincho \
    gcc \
    gettext \
    git \
    git-svn \
    libbz2-dev \
    liblua5.2-dev \
    libluajit-5.1-dev \
    libncurses5-dev \
    libncursesw5-dev \
    libperl-dev \
    libreadline-dev \
    libsqlite3-dev \
    libssl-dev \
    llvm \
    locales \
    lua5.2 \
    luajit \
    make \
    python-dev \
    python3-dev \
    ruby-dev \
    screen \
    subversion \
    tcl-dev \
    tmux \
    openssh-server \
    tk-dev \
    vim-syntax-docker \
    wget \
    xauth \
    xz-utils \
    zlib1g-dev \
    zsh \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN locale-gen en_US.UTF-8 \
 && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US:en LC_ALL=en_US.UTF-8

ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN mkdir /var/run/sshd \
 && echo 'X11UseLocalhost no' >> /etc/ssh/sshd_config

RUN cd /usr/local/src \
 && git clone https://github.com/vim/vim \
 && cd vim \
 && ./configure \
    --enable-fail-if-missing \
    --with-features=huge \
    --disable-selinux \
    --enable-multibyte \
    --enable-perlinterp=dynamic \
    --enable-pythoninterp=dynamic \
    --enable-python3interp=dynamic \
    --enable-rubyinterp=dynamic \
    --enable-tclinterp=yes \
    --enable-luainterp=dynamic \
    --with-luajit \
 && make \
 && make install \
 && cd .. \
 && rm -rf vim

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
