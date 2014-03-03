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

License
-------
> Copyright (C) 2014 asylumfunk

>This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

>This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

>You may obtain a copy of this license at:
http://www.gnu.org/licenses/gpl-3.0.html

