SHELL = /bin/sh
TESTS_IMAGE_NAME = airscript/tests:base
CI_IMAGE_NAME = airscript/ci:base

.SUFFIXES:
.SUFFIXES: .sh

.PHONY: all
all: build run

.PHONY: clean
clean:
	docker compose down
	cd ./themes/PaperMod && find . -name "*" -delete
	cd ./tests/bats && find . -name "*" -delete
	cd ./tests/libraries/bats-assert && find . -name "*" -delete
	cd ./tests/libraries/bats-support && find . -name "*" -delete

.PHONY: build
build: git-submodules
	docker compose build

.PHONY: run
run:
	docker compose up -d

.PHONY: all-tests
all-tests: build-tests run-tests

.PHONY: clean-tests
clean-tests:
	docker rmi $(TESTS_IMAGE_NAME)

.PHONY: build-tests
build-tests:
	mkdir -p tmp && \
	cp -r .git .docker scripts tests Makefile tmp && \
	docker build -f .docker/dockerfiles/tests.Dockerfile -t $(TESTS_IMAGE_NAME) .; \
	rm -rf tmp

.PHONY: run-tests
run-tests:
	docker run --rm -it $(TESTS_IMAGE_NAME) && \
	docker rmi $(TESTS_IMAGE_NAME)

.PHONY: all-ci-configs
all-ci-configs: build-ci-configs run-ci-configs

.PHONY: clean-ci-configs
clean-ci-configs:
	docker rmi $(CI_IMAGE_NAME)

.PHONY: build-ci-configs
build-ci-configs:
	mkdir -p tmp && \
	cp -r  .circleci .docker scripts Makefile tmp && \
	docker build -f .docker/dockerfiles/ci.Dockerfile -t $(CI_IMAGE_NAME) .; \
	rm -rf tmp

.PHONY: run-ci-configs
run-ci-configs:
	docker run --rm -it $(CI_IMAGE_NAME) && \
	docker rmi $(CI_IMAGE_NAME)

.PHONY: install-bash
install-bash:
	sh ./scripts/install/bash.sh

.PHONY: install-bats
install-bats:
	sh ./scripts/install/bats.sh

.PHONY: install-npm
install-npm:
	bash ./scripts/install/npm.sh

.PHONY: install-curl
install-curl:
	bash ./scripts/install/curl.sh

.PHONY: install-hugo
install-hugo:
	bash ./scripts/install/hugo.sh

.PHONY: install-git
install-git:
	bash ./scripts/install/git.sh $(environment)

.PHONY: install-docker-cli
install-docker-cli:
	bash ./scripts/install/docker-cli.sh

.PHONY: install-circleci-cli
install-circleci-cli:
	bash ./scripts/install/circleci-cli.sh

.PHONY: install-netlify-cli
install-netlify-cli:
	bash ./scripts/install/netlify-cli.sh

.PHONY: verify-ci
verify-ci:
	bash ./scripts/ci/verify.sh $(environment)

.PHONY: build-ci
build-ci:
	bash ./scripts/ci/build.sh

.PHONY: deploy-ci
deploy-ci:
	bash ./scripts/ci/deploy.sh $(id) $(token)

.PHONY: publish-ci
publish-ci: docker-login docker-build docker-push

.PHONY: git-submodules
git-submodules:
	bash ./scripts/shared/git-submodules.sh $(environment)

.PHONY: docker-login
docker-login: 
	bash ./scripts/docker/login.sh $(username) $(token)

.PHONY: docker-build
docker-build:
	bash ./scripts/docker/build.sh $(tag)

.PHONY: docker-push
docker-push:
	bash ./scripts/docker/push.sh $(tag)

.PHONY: tests-base
tests-base:
	bash scripts/tests/base.sh
