#!./tests/bats/bin/bats

setup() {
    load 'libraries/bats-support/load'
    load 'libraries/bats-assert/load'
    source ./tests/mocks.sh
}

@test "Run Script" {
    run ./scripts/bats.sh
}

@test "Install Bash" {
    run ./scripts/install/bash.sh
    assert_output --partial "$INSTALL_BASH"
    refute_output --partial "ERROR"
}