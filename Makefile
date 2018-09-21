
## Minimal and hackish packaging for Alegreya
##
## This Makefile downloads from GitHub, extracts the OTF files and
## lets the Debian packaging in debian/ do the rest. Just call
##
##     dpkg-buildpackage -rfakeroot -us -uc -tc
##
## or just
##
##     runMe.sh
##
## to have the package build using 'fake' suid, do not sign (as we're
## not uploading anywhere) and clean.
##
## Copyright (C) 2016 - 2018  Dirk Eddelbuettel
## and released under GPL (>=2 )


## check with https://github.com/adobe-fonts/source-code-pro/releases for version
srcfile="https://github.com/huertatipografica/Alegreya-Sans/archive/v2.008.tar.gz"
outfile=$(shell basename ${srcfile})

all:
	test -f ${outfile} || wget ${srcfile} 
	tar xfz ${outfile}
	mkdir otf ttf
	mv Alegreya*/fonts/otf/* otf/
	mv Alegreya*/fonts/ttf/* ttf/
	rm -rf Alegreya*

clean:
	rm -f ${outfile}
	rm -rf otf/ ttf/
