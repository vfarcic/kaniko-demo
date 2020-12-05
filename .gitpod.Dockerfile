FROM gitpod/workspace-full

RUN brew install hugo
RUN mkdir -p /home/gitpod/copilot/bin
RUN curl -Lo /home/gitpod/copilot/bin/copilot https://github.com/aws/copilot-cli/releases/latest/download/copilot-linux
RUN chmod +x /home/gitpod/copilot/bin/copilot
ENV PATH $PATH:/home/gitpod/copilot/bin

