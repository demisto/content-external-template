#!/bin/bash


echo "Checking git is installed..."
command -v git >/dev/null 2>&1 || { echo >&2 "git is not installed.  Aborting."; exit 1; }


echo "Bootstrap started"

PREMIUM="Premium"
RESELLER="Reseller"

tmp_dir=$(mktemp -d)
mkdir Packs

# Function to bootstrap Premium Content
bootstrap_premium () {
	echo "Starting bootstrap of $PREMIUM content Pack..."
	
	git clone --quiet https://github.com/demisto/content-helloworld-premium.git "$tmp_dir"
	mv "$tmp_dir/Packs/HelloWorldPremium" ./Packs
	output_dir=$(realpath ./Packs/HelloWorldPremium)
}

# Function to bootstrap resller Content
bootstrap_reseller () {
	echo "Starting bootstrap of $RESELLER content Pack..."

	git clone --quiet https://github.com/demisto/content-helloworld-premium.git "$tmp_dir"
	mv "$tmp_dir/Packs/HelloWorldPremium-Resell/" ./Packs
	output_dir=$(realpath ./Packs/HelloWorldPremium-Resell)
}


PS3='Please make a selection: '
options=($PREMIUM $RESELLER)
select opt in "${options[@]}"
do
    case $opt in

        $PREMIUM)
			bootstrap_premium
			break
            ;;

        $RESELLER)
            bootstrap_reseller
			break
            ;;

        *) 
			echo "invalid option $REPLY"
			;;
    esac
done


rm -rf $tmp_dir
echo "Cleaned up temporary directory"

echo "Bootstrap complete."
echo "You may now review the files located in '$output_dir'"
echo "See https://xsoar.pan.dev/docs/packs/packs-format for more information about Pack format and explanation about each file and folder"