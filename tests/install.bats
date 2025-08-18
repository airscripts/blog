#!./tests/bats/bin/bats

setup() {
    load 'libraries/bats-support/load'
    load 'libraries/bats-assert/load'
    source ./tests/mocks.sh
}

@test "Install Docker CLI" {
    run ./scripts/install/docker-cli.sh
    assert_output --partial "$INSTALL_DOCKER_CLI"
    refute_output --partial "ERROR"
}

@test "Install Git" {
    run ./scripts/install/git.sh
    assert_output --partial "$INSTALL_GIT"
    refute_output --partial "ERROR"
    refute_output --partial "$SKIP_INSTALL_GIT"
}

@test "Skip install Git" {
    run ./scripts/install/git.sh compose
    assert_output --partial "$SKIP_INSTALL_GIT"
    refute_output --partial "ERROR"
    refute_output --partial "$INSTALL_GIT"
}

@test "Install Hugo" {
    run ./scripts/install/hugo.sh
    assert_output --partial "$INSTALL_HUGO"
    refute_output --partial "ERROR"
}

@test "Install Make" {
    run ./scripts/install/make.sh
    assert_output --partial "$INSTALL_MAKE"
    refute_output --partial "ERROR"
}

@test "Install gpp" {
    run ./scripts/install/gpp.sh
    assert_output --partial "$INSTALL_GPP"
    refute_output --partial "ERROR"
}

@test "Install python3" {
    run ./scripts/install/python3.sh
    assert_output --partial "$INSTALL_PYTHON3"
    refute_output --partial "ERROR"
}

@test "Install npm" {
    run ./scripts/install/npm.sh
    assert_output --partial "$INSTALL_NPM"
    refute_output --partial "ERROR"
}

@test "Install Vercel CLI" {
    run ./scripts/install/vercel-cli.sh
    assert_output --partial "$INSTALL_VERCEL_CLI"
    refute_output --partial "ERR!"
}

@test "Install devcontainer CLI" {
    run ./scripts/install/devcontainer-cli.sh
    assert_output --partial "$INSTALL_DEVCONTAINER_CLI"
    refute_output --partial "ERR!"
}

@test "Install Bats" {
    run ./scripts/install/bats.sh
    assert_output --partial "$INSTALL_BATS"
    refute_output --partial "ERR!"
}

@test "Install curl" {
    run ./scripts/install/curl.sh
    assert_output --partial "$INSTALL_CURL"
    refute_output --partial "ERROR"
}

@test "Install CircleCI CLI" {
    run ./scripts/install/circleci-cli.sh
    assert_output --partial "$INSTALL_CIRCLECI_CLI"
    refute_output --partial "404"
}
