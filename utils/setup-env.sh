#!/bin/bash
#
# Create mini-dinstall repo directory in $HOME/berrynet-repo/.

codename="$(lsb_release -c -s)"
repodir="$HOME/berrynet-repo"
config_filename="mini-dinstall-$codename.conf"
config_source="$(pwd)/$config_filename"
config="$repodir/$config_filename"
dput_config="$(pwd)/dput.cf"
sign_release="$(pwd)/sign-release.sh"


check_preconditions() {
    echo "Pre-conditions"
    echo "    1. Setup the GNUPG key for signature."
    echo "    2. Add $HOME/.gnupg/passphrase, and chmod 600."
    echo "Are you ready? (y/n): "
    read answer
    if [ "$answer" = "y" ]; then
        echo "Continue"
    else
        echo "Please finish pre-conditions before running this script."
        exit 1
    fi
}

install_deb_scripts() {
    sudo apt install -y devscripts debhelper
}

install_mini_dinstall() {
    sudo apt install -y mini-dinstall

    mkdir -p $HOME/bin
    cp $sign_release $HOME/bin
}

create_repo_dir() {
    echo "Create $repodir"
    mkdir -p $repodir
}

copy_dput_config() {
    if [ -e "$dput_config" ]; then
        echo "Copy $dput_config as $HOME/.dput.cf."
        cp $dput_config $HOME/.dput.cf
    else
        echo "Please run this script in the root directory of Berrynet-repo."
        exit 1
    fi
}

copy_mini_dinstall_config() {
    if [ -e "$config_source" ]; then
        echo "Copy $config_source to $repodir."
        cp $config_source $repodir
    else
        echo "Please run this script in the root directory of Berrynet-repo."
        exit 1
    fi
}

run_mini_dinstall() {
    echo "Go to $repodir"
    pushd $repodir

    echo "run mini-dinstall"
    mini-dinstall -v --no-db -b -c $config

    popd
}

main() {
    check_preconditions
    install_deb_scripts
    install_mini_dinstall
    create_repo_dir
    copy_dput_config
    copy_mini_dinstall_config
    run_mini_dinstall
}


main
