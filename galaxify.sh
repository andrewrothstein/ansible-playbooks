#!/bin/bash
GIT_ROOT=~/git/github/andrewrothstein
SRC=$GIT_ROOT/ansible-julia
DEST=$GIT_ROOT/$1

echo '**~' > $DEST/.gitignore
mkdir -p $DEST/{defaults,meta}
cp $SRC/LICENSE $DEST/LICENSE
cp $SRC/meta/main.yml $DEST/meta/main.yml
cp $SRC/test.yml $DEST/test.yml
