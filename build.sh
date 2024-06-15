#!/bin/bash

# Load conan venv
source ~/.python-venv/conan2/bin/activate 2> /dev/null || print "\nSkip loading conan venv.\n\n"

pushd sum
conan create . --user=mz --channel=stable || exit 1
popd

pushd example
conan create . --user=mz --channel=stable || exit 1
popd

exit 0
