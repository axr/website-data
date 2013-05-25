We use Vagrant for creating a development environment for the website. This
ensures that everybody runs the website in an identical environment and there
won't be any compatibility problems later.

## Installing Vagrant

Installing [Vagrant](http://vagrantup.com/) is extremely easy. All you need to
do is download the appropriate installer from [downloads.vagrantup.com](http://downloads.vagrantup.com/)
and then follow the standard procedures for your operating system.

Vagrant also requires you to have VirtualBox or some other virtualization
provider installed. You can read more about that at
http://docs.vagrantup.com/v2/providers/index.html

## Getting the code

You can clone the source-code for the website from GitHub:

	git clone git://github.com/axr/website.git axr-website
	cd axr-website
	git submodule update --init --recursive
	git checkout develop

## Using Vagrant

To start the Vagrant VM, all you need to do is `cd` into the directory where you
cloned the website and then run `vagrant up`.

On the first time this may take some time since Vagrant will have to download
the VM image and install everything. When the initial start is done, starting
the VM will be just a matter of seconds.

You can SSH into the VM using `vagrant ssh`, however normally you won't need
that.

To shut down the VM, run `vagrant halt`.

You can find more information about using Vagrant from their [documentation](http://docs.vagrantup.com/v2/)
