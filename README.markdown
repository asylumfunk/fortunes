fortunes
========

Installation Instructions
-------------------------
```sh
git clone https://github.com/asylumfunk/fortunes.git
cd fortunes
make && sudo make install
```

Custom Examples
---------------
- stage installation in temporary directory
	- `make DESTDIR="/tmp/stage" install`
- install to `~/fortunes`
	- `make INSTALL_PATH="~/fortunes" install`
- output to BZIPed archive with today's date
	- `make DIST_DIR="fortunes-$(date +%Y%m%d)" DIST_EXT=".tar.bz" dist`

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

External References
-------------------
- [Fortune (Wikipedia)](https://en.wikipedia.org/wiki/Fortune_(Unix))
- [Makefile Conventions](https://www.gnu.org/prep/standards/html_node/Makefile-Conventions.html)

