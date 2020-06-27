FROM golang:1.14-alpine

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

RUN printf "ls -la" > /bin/ll && chmod +x /bin/ll
RUN rm -rf ~/.cache ~/.ash_history