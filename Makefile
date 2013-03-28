hqx := `which hqx`
filenames := $(notdir $(wildcard base/*.png))
sizes := 16x16 32x32 48x48 64x64
directory = $(color)/$(size)
directories = $(foreach size, $(sizes), $(directory))
files_1 = $(foreach file, $(filenames), $(directory)/$(file))
files = $(foreach size, $(sizes), $(files_1))

allcolors := red orange yellow green blue purple pink royalblue turquoise

all:
	$(foreach color, $(allcolors), make --no-print-directory color=$(color) $(color);)

white: $(foreach color, white, $(directories)) $(foreach color, white, $(files)) 
$(color): white $(directories) $(foreach color, $(color), $(files))

%/16x16:
	mkdir -p $@

%/32x32:
	mkdir -p $@

%/48x48:
	mkdir -p $@

%/64x64:
	mkdir -p $@

clean:
	rm -rf white $(allcolors)

white/16x16/%.png: base/%.png
	convert $< -alpha Background \( +clone -background black -shadow 100x0+1+1 \) -background none -compose DstOver -flatten $@

white/32x32/%.png: base/%.png
	$(hqx) -s 2 $< $@
	convert $@ -alpha Background \( +clone -background black -shadow 100x0+1+1 \) -background none -compose DstOver -flatten $@

white/48x48/%.png: base/%.png
	$(hqx) -s 3 $< $@
	convert $@ -alpha Background \( +clone -background black -shadow 100x0+1+1 \) -background none -compose DstOver -flatten $@

white/64x64/%.png: base/%.png
	$(hqx) -s 4 $< $@
	convert $@ -alpha Background \( +clone -background black -shadow 100x0+1+1 \) -background none -compose DstOver -flatten $@

$(color)/16x16/%.png: white/16x16/%.png
	convert $< -fill $(color) -tint 100 -modulate 100,200 $@

$(color)/32x32/%.png: white/32x32/%.png
	convert $< -fill $(color) -tint 100 -modulate 100,200 $@

$(color)/48x48/%.png: white/48x48/%.png
	convert $< -fill $(color) -tint 100 -modulate 100,200 $@

$(color)/64x64/%.png: white/64x64/%.png
	convert $< -fill $(color) -tint 100 -modulate 100,200 $@

