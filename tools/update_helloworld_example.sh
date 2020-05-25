#!/bin/bash

mktemp -d /tmp/content
git clone git@github.com:demisto/content.git /tmp/content

echo Copying Hello World example
mv /tmp/content/Packs/HelloWorld Packs

echo Deleting the cloned content repository
rm -rf tmp/content

