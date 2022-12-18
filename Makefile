SHELL = /bin/sh

CI_IMAGE_NAME = airscript/ci:base
TESTS_IMAGE_NAME = airscript/tests:base
BLOG_IMAGE_NAME = airscript/blog:compose

.SUFFIXES:
.SUFFIXES: .sh

.PHONY: all
all: build run

.PHONY: setup
setup:
	git config --local core.hooksPath .githooks/

.PHONY: clean
clean:
	docker compose down
	docker rmi $(BLOG_IMAGE_NAME)
	cd ./themes/PaperMod && find . -name "*" -delete
	cd ./tests/bats && find . -name "*" -delete
	cd ./tests/libraries/bats-assert && find . -name "*" -delete
	cd ./tests/libraries/bats-support && find . -name "*" -delete

.PHONY: hash
hash:
	cat static/css/offline.css | openssl dgst -sha512 -binary | openssl base64 -A
	cat static/js/notifications/dictionary.js | openssl dgst -sha512 -binary | openssl base64 -A
	cat static/js/notifications/i18n.js | openssl dgst -sha512 -binary | openssl base64 -A
	cat static/js/notifications/main.js | openssl dgst -sha512 -binary | openssl base64 -A

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
	docker run --rm $(TESTS_IMAGE_NAME) && \
	docker rmi $(TESTS_IMAGE_NAME)

.PHONY: all-ci
all-ci: build-ci run-ci

.PHONY: clean-ci
clean-ci:
	docker rmi $(CI_IMAGE_NAME)

.PHONY: build-ci
build-ci:
	mkdir -p tmp && \
	cp -r  .circleci .docker scripts Makefile tmp && \
	docker build -f .docker/dockerfiles/ci.Dockerfile -t $(CI_IMAGE_NAME) .; \
	rm -rf tmp

.PHONY: run-ci
run-ci:
	docker run --rm $(CI_IMAGE_NAME) && \
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

.PHONY: ci-verify
ci-verify:
	bash ./scripts/ci/verify.sh $(environment)

.PHONY: ci-build
ci-build:
	bash ./scripts/ci/build.sh

.PHONY: ci-deploy
ci-deploy:
	bash ./scripts/ci/deploy.sh $(id) $(token)

.PHONY: ci-publish
ci-publish: docker-login docker-build docker-push

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
