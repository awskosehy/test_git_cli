FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN set -ex; \
    apt-get update && \
    apt-get install -y ca-certificates curl gnupg lsb-release wget nano && \
    wget https://download.docker.com/linux/ubuntu/gpg && \
    apt-key add gpg && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
    apt-get update && \
    apt-get install -y containerd.io docker-ce=5:20.10.11~3-0~ubuntu-focal docker-ce-cli=5:20.10.11~3-0~ubuntu-focal docker-compose git && \
    rm -rf /var/lib/apt/lists/*
ENV GITHUB_CLI_VERSION 2.5.2

RUN set -ex; \
    curl -L "https://github.com/cli/cli/releases/download/v${GITHUB_CLI_VERSION}/gh_${GITHUB_CLI_VERSION}_checksums.txt" -o checksums.txt; \
    curl -OL "https://github.com/cli/cli/releases/download/v${GITHUB_CLI_VERSION}/gh_${GITHUB_CLI_VERSION}_linux_amd64.deb"; \
    shasum --ignore-missing -a 512 -c checksums.txt; \
	dpkg -i "gh_${GITHUB_CLI_VERSION}_linux_amd64.deb"; \
	rm -rf "gh_${GITHUB_CLI_VERSION}_linux_amd64.deb"; \
    # verify gh binary works
    gh --version; \
    git clone -b test https://github.com/awskosehy/test_git_cli.git /data/gh/test_git_cli;

ENV APP_HOME /data/gh/test_git_cli
COPY . ${APP_HOME}
WORKDIR ${APP_HOME}

RUN gh auth login --with-token < token