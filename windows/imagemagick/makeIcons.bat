
@REM Use Imagemagick to convert a raster or svg image to an icon set

@REM magick convert -density 256x256 -background transparent .\assets\icon.svg -define icon:auto-resize -colors 256 .\assets\icon.ico
magick convert -density 256x256 -background transparent %1 -define icon:auto-resize -colors 256 %2