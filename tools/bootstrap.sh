#!/bin/bash


echo "Checking git is installed..."
command -v git >/dev/null 2>&1 || { echo >&2 "git is not installed.  Aborting."; exit 1; }


echo "Bootstrap started"

PREMIUM="Premium"
RESELLER="Reseller"

tmp_dir=$(mktemp -d)
mkdir Packs

# Function to bootstrap
bootstrap () {
	echo "Starting bootstrap of content '$2' Pack..."
	
	git clone --quiet https://github.com/demisto/content-helloworld-premium.git "$tmp_dir"
	mv "$tmp_dir/Packs/$1" ./Packs
	output_dir=$(realpath ./Packs/$1)
}


PS3='Please make a selection: '
options=($PREMIUM $RESELLER)
select opt in "${options[@]}"
do
	case $opt in

		$PREMIUM)
			bootstrap "HelloWorldPremium" $opt
			break
			;;

		$RESELLER)
			bootstrap "HelloWorldPremium-Resell" $opt
			break
			;;

		*) 
			echo "Invalid option '$opt'. Please type 1 or 2."
			;;
	esac
done


rm -rf $tmp_dir
echo "Cleaned up temporary directory"

echo "Bootstrap complete."
echo "You may now review the files located in '$output_dir'"
echo "See https://xsoar.pan.dev/docs/packs/packs-format for more information about Pack format and explanation about each file and folder"