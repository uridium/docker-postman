REPO = uridium/postman
UID = $(shell id -u)
GID = $(shell id -g)
CONFDIR = .config/Postman

.PHONY: pull build run clean

default: run

pull:
	docker pull $(REPO)

build:
	docker build --build-arg UID=$(UID) --build-arg GID=$(GID) -t $(REPO) .

run:
	test -d $${HOME}/$(CONFDIR) || mkdir $${HOME}/$(CONFDIR)
	docker run --rm --network host --name postman -u "$(UID):$(GID)" -v "$${HOME}/$(CONFDIR):/home/postman/$(CONFDIR):rw" -e DISPLAY $(REPO)

test:
	docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v $(shell pwd)/tests.yml:/tests.yml gcr.io/gcp-runtimes/container-structure-test test -i $(REPO) -c tests.yml

clean:
	docker rmi $(shell docker images $(REPO) -qa)
