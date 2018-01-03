REPO = uridium/postman
UID = $(shell id -u)
GID = $(shell id -g)

.PHONY: pull build run clean

default: run

pull:
	docker pull $(REPO)

build:
	docker build --build-arg UID=$(UID) --build-arg GID=$(GID) -t $(REPO) .

run:
	docker run --rm --network host --name postman -u "$(UID):$(GID)" -v "$(shell pwd)/.config:/home/postman/.config/Postman:rw" -e DISPLAY $(REPO)

clean:
	docker rmi $(shell docker images $(REPO) -qa)
