SHELL = /bin/sh

.SUFFIXES:
.SUFFIXES: .sh

.PHONY: all
all: build run

.PHONY: clean
clean:
	docker compose down
	cd ./themes/PaperMod && find . -name "*" -delete
	cd ./tests/bats && find . -name "*" -delete
	cd ./tests/test_helper/bats-assert && find . -name "*" -delete
	cd ./tests/test_helper/bats-support && find . -name "*" -delete

.PHONY: build
build: git-submodules
	docker compose build

.PHONY: run
run:
	docker compose up -d

.PHONY: all-test
all-test: build-test run-test

.PHONY: clean-test
clean-test:
	docker rmi airscript/bats

.PHONY: clean-bats
clean-bats:
	docker rmi bats/bats:1.7.0

.PHONY: build-test
build-test:
	docker build -f .docker/bats.Dockerfile -t airscript/bats .

.PHONY: run-test
run-test:
	docker run -it --name="worker-bats" airscript/bats ./tests
	docker rm worker-bats

.PHONY: install-bash
install-bash:
	sh ./scripts/install/bash.sh

.PHONY: install-npm
install-npm:
	sh ./scripts/install/npm.sh

.PHONY: install-netlify-cli
install-netlify-cli:
	sh ./scripts/install/netlify-cli.sh

.PHONY: install-hugo
install-hugo:
	sh ./scripts/install/hugo.sh

.PHONY: install-cli
install-git:
	sh ./scripts/install/git.sh $(env)

.PHONY: install-docker-cli
install-docker-cli:
	sh ./scripts/install/docker-cli.sh

.PHONY: verify-ci
verify-ci:
	sh ./scripts/ci/verify.sh $(env)

.PHONY: build-ci
build-ci:
	sh ./scripts/ci/build.sh

.PHONY: deploy-ci
deploy-ci:
	sh ./scripts/ci/deploy.sh $(id) $(token)

.PHONY: publish-ci
publish-ci: docker-login docker-build docker-push

.PHONY: git-submodules
git-submodules:
	sh ./scripts/shared/git-submodules.sh $(env)

.PHONY: docker-login
docker-login: 
	sh ./scripts/docker/login.sh $(username) $(token)

.PHONY: docker-build
docker-build:
	sh ./scripts/docker/build.sh $(tag)

.PHONY: docker-push
docker-push:
	sh ./scripts/docker/push.sh $(tag)
