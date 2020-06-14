#!/bin/bash

tmp_dir=$(mktemp -d)
GIT_LFS_SKIP_SMUDGE=1 git clone https://github.com/demisto/content.git $tmp_dir

echo "Copying Hello World example from ${tmp_dir}/Packs/HelloWorld"
rm -rf Packs/HelloWorld
mv "${tmp_dir}/Packs/HelloWorld" Packs

rm -rf ${tmp_dir}