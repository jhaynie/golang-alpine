NS = jhaynie
REPO = golang-alpine
NAME = golang-alpine
LABEL := latest

.PHONY: build shell rm

build:
	docker build $(OPTS) -t $(NS)/$(REPO):$(LABEL) .

shell:
	docker run $(OPTS) --rm --name $(NAME) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO) /bin/bash

publish:
	docker push $(NS)/$(REPO):$(LABEL)

rm:
	docker rm $(OPTS) $(NAME)

default: build
