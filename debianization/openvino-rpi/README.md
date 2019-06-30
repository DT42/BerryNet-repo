1. Download OpenVINO for RPi from Intel

    https://docs.openvinotoolkit.org/latest/_docs_install_guides_installing_openvino_raspbian.html

1. Unpack to this dir

    $ tar xzf l_openvino_toolkit_raspbi_p_2019.1.144.tgz -C .

1. Build Debian binary package

    $ debuild -b -us -uc
