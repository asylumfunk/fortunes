fortunes
========

Installation Instructions
-------------------------
```sh
git clone https://github.com/asylumfunk/fortunes.git
cd fortunes
make && sudo make install
```

Makefile Targets
----------------
- `make`
	- create `build` directory with `.dat` files, needed by `fortune`
		- default to `./build`
- `make clean`
	- remove `build` directory
- `make dist`
	- create distributable archive of fortunes
		- default to `fortunes.tar.gz`
- `make distclean`
	- remove distributable archive and `build` directory
- `make install`
	- install fortunes
		- default to `/usr/share/games/fortunes`
- `make uninstall`
	- uninstall fortunes


