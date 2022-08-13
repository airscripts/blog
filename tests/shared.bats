#!./tests/bats/bin/bats

setup() {
    load 'libraries/bats-support/load'
    load 'libraries/bats-assert/load'
    source ./tests/mocks.sh
    apk add git
}

@test "Add Git Submodules" {
    run ./scripts/shared/git-submodules.sh
    assert_output "$ADD_GIT_SUBMODULE_EXECUTED"
}

@test "Skip Git Submodules" {
    run ./scripts/shared/git-submodules.sh compose
    assert_output "$ADD_GIT_SUBMODULE_SKIPPED"
}