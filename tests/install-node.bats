#!./tests/bats/bin/bats

setup() {
    load 'libraries/bats-support/load'
    load 'libraries/bats-assert/load'
    source ./tests/mocks.sh
}

@test "Install npm" {
    run ./scripts/install/npm.sh
    assert_output --partial "$INSTALL_NPM"
    refute_output --partial "ERR!"
}

@test "Install Netlify CLI" {
    run ./scripts/install/netlify-cli.sh
    assert_output --partial "$INSTALL_NETLIFY_CLI"
    refute_output --partial "ERR!"
}
