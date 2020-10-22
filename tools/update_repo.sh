#!/bin/bash

#!/bin/bash

output_paths=(
    "CommonServerPython.py"
    "CommonServerPowerShell.ps1"
    "demistomock.py"
    "demistomock.ps1"
    "dev_envs/default_python2/Pipfile"
    "dev_envs/default_python2/Pipfile.lock"
    "dev_envs/default_python3/Pipfile"
    "dev_envs/default_python3/Pipfile.lock"
    "dev_envs/pytest/conftest.py"
    "dev-requirements-py2.txt"
    "dev-requirements-py3.txt"
    "package.json"
    "package-lock.json"
)

url_to_fetch_from=(
    "https://raw.githubusercontent.com/demisto/content/master/Packs/Base/Scripts/CommonServerPython/CommonServerPython.py"
    "https://raw.githubusercontent.com/demisto/content/master/Packs/Base/Scripts/CommonServerPowerShell/CommonServerPowerShell.ps1"
    "https://raw.githubusercontent.com/demisto/content/master/Tests/demistomock/demistomock.py"
    "https://raw.githubusercontent.com/demisto/content/master/Tests/demistomock/demistomock.ps1"
    "https://raw.githubusercontent.com/demisto/content/master/Tests/scripts/dev_envs/default_python2/Pipfile"
    "https://raw.githubusercontent.com/demisto/content/master/Tests/scripts/dev_envs/default_python2/Pipfile.lock"
    "https://raw.githubusercontent.com/demisto/content/master/Tests/scripts/dev_envs/default_python3/Pipfile"
    "https://raw.githubusercontent.com/demisto/content/master/Tests/scripts/dev_envs/default_python3/Pipfile.lock"
    "https://raw.githubusercontent.com/demisto/content/master/Tests/scripts/dev_envs/pytest/conftest.py"
    "https://raw.githubusercontent.com/demisto/content/master/dev-requirements-py2.txt"
    "https://raw.githubusercontent.com/demisto/content/master/dev-requirements-py3.txt"
    "https://raw.githubusercontent.com/demisto/content/master/package.json"
    "https://raw.githubusercontent.com/demisto/content/master/package-lock.json"
)

mkdir -p dev_envs/default_python2
mkdir -p dev_envs/default_python3
mkdir -p dev_envs/pytest

is_failed=0


for i in ${!output_paths[@]};
do
    output_path=${output_paths[$i]}
    url=${url_to_fetch_from[$i]}

    $(curl -o $output_path $url --fail)
    exit_code=$?
    is_failed=$(($is_failed+$exit_code))

    if [ $exit_code -ne 0 ]
    then
        echo Failed to download $url
    fi
done

if [ $is_failed -ne 0 ]
then
    exit 1
fi

exit 0
