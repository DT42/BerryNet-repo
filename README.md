# BerryNet Repository

BerryNet leverages Debian package management system to control system quality, and make installation easier. Our goal is to making all these packages to be available into Debian. Before these packages are accepted officially, you still can get them easily by using the repository hosted by us.

# Setup

BerryNet repository will be ready after BerryNet installation. If you want to use BerryNet repository manually, here are the steps:

1. Setup the BerryNet sources list (one of the two methods below)

    * Method 1: Copy `<berrynet>/config/berrynet.list` to `/etc/apt/sources.list.d/`
    * Method 2: Create `/etc/apt/sources.list.d/berrynet.list` with the content below

      ```
      deb http://repo.berrynet.org/ stretch/
      deb-src http://repo.berrynet.org/ stretch/
      ```

1. Add BerryNet repository key

    ```
    $ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv C0C4CC4C
    ```

1. Update package management system

    ```
    $ sudo apt-get update
    ```
