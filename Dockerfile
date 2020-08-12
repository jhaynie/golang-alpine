FROM golang:1.15-alpine

RUN apk add --no-cache --virtual .build-deps \
	alpine-sdk \
	cmake \
	sudo \
	libssh2 libssh2-dev \
	git \
	dep \
	bash \
	curl

RUN cd /bin && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && chmod +x /bin/kubectl
RUN cd /bin && curl -s https://raw.githubusercontent.com/kubernetes-sigs/kustomize/master/hack/install_kustomize.sh  | bash
RUN cd /bin && curl -LO https://github.com/wercker/stern/releases/download/1.11.0/stern_linux_amd64 && mv /bin/stern_linux_amd64 /bin/stern && chmod +x /bin/stern
RUN cd $HOME && git clone https://github.com/ahmetb/kubectx /opt/kubectx && mv /opt/kubectx/kubectx /bin/kubectx && mv /opt/kubectx/kubens /bin/kubens && rm -rf /opt/kubectx
RUN cd /bin && curl -OJL https://github.com/operator-framework/operator-sdk/releases/download/v0.19.0/operator-sdk-v0.19.0-x86_64-linux-gnu && mv operator-sdk-v0.19.0-x86_64-linux-gnu /bin/operator-sdk && chmod +x /bin/operator-sdk

RUN printf "ls -la" > /bin/ll && chmod +x /bin/ll
RUN rm -rf ~/.cache ~/.ash_history
