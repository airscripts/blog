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