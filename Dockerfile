# ##############
# based on Dockerfile found at
# https://github.com/microsoft/vscode-dev-containers/tree/v0.234.0/containers/python-3-anaconda/.devcontainer
# ############## 
FROM mcr.microsoft.com/vscode/devcontainers/anaconda:0-3

# [Choice] Node.js version: none, lts/*, 16, 14, 12, 10
ARG NODE_VERSION="none"
RUN if [ "${NODE_VERSION}" != "none" ]; then su vscode -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} 2>&1"; fi

# Copy environment.yml (if found) to a temp location so we update the environment. Also
# copy "noop.txt" so the COPY instruction does not fail if no environment.yml exists.
# TODO make environment name dynamic 
COPY environment.yml* .devcontainer/noop.txt /tmp/conda-tmp/
RUN if [ -f "/tmp/conda-tmp/environment.yml" ]; then umask 0002 && /opt/conda/bin/conda env create -f /tmp/conda-tmp/environment.yml; fi \
    && rm -rf /tmp/conda-tmp \
    && echo "conda activate ml4t" >> ~/.bashrc

RUN  echo ". /opt/conda/etc/profile.d/conda.sh" >> /home/vscode/.bashrc && echo "conda activate ml4t" >> /home/vscode/.bashrc

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends openssh-server git 
