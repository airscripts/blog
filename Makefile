SHELL = /bin/sh

.SUFFIXES:
.SUFFIXES: .sh

.PHONY: 
	all
	run
	build
	clean

all: build run

clean:
	docker compose down
	cd ./themes/PaperMod && find . -name "*" -delete

build: git-submodules
	docker compose build

run:
	docker compose up -d

install-npm:
	sh ./scripts/install/npm.sh

install-netlify-cli:
	sh ./scripts/install/netlify-cli.sh

install-hugo:
	sh ./scripts/install/hugo.sh

install-git:
	sh ./scripts/install/git.sh $(env)

install-docker-cli:
	sh ./scripts/install/docker-cli.sh

verify-ci:
	sh ./scripts/ci/verify.sh $(env)

build-ci:
	sh ./scripts/ci/build.sh

deploy-ci:
	sh ./scripts/ci/deploy.sh $(id) $(token)

publish-ci: docker-login docker-build docker-push

git-submodules:
	sh ./scripts/shared/git-submodules.sh $(env)

docker-login: 
	sh ./scripts/docker/login.sh $(username) $(token)

docker-build:
	sh ./scripts/docker/build.sh $(tag)

docker-push:
	sh ./scripts/docker/push.sh $(tag)
