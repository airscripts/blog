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