#!/bin/bash

echo "Bootstrap started"
echo "Creating temporary folder to store repository..."
tmp_dir=$(mktemp -d)
git clone https://github.com/demisto/content-helloworld-premium $tmp_dir
mv $tmp_dir/Packs ./

echo "Cleaning up temporary folder"
rm -rf $tmp_dir
echo "Temporary folder cleaned"

echo "Bootstrap complete! Time to review and modify the sample Pack found in ./Packs/HelloWorldPremium to your Premium Pack"
echo "Follow https://github.com/demisto/content-external-template#adding-your-pack"