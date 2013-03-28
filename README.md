About
-----
This Makefile generates 16x16, 32x32, 48x48, and 64x64 icons from a set of
16x16 "base" icons. Each base icon is stretched using [hq2x, hq3x, and 
hq4x][hqx], and is a shadow is added and tinting to many colors using
[ImageMagick][].

[hqx]: http://code.google.com/p/hqx
[ImageMagick]: http://www.imagemagick.org

Prequisites
-----------
Build hqx from source and put the `hqx` binary somewhere in your path.
Have ImageMagick installed.

Usage
-----
Create a set of base images; place them in a directory named base.

(Your directory layout should look like this):

	base/
		icon1.png
		icon2.png
		icon3.png
		...
	Makefile

Run make, enjoy.

Tips
----
Using ImageMagick's ability to make all the transparent pixels the same color
is useful when the resized versions have artifacts. For example:

	convert base/image.png -alpha Background -background black base/image.png
