# Automatically generate course certificates

This is just a simple SVG template stored as "plain" so that using things like "sed" we can automatically replace known strings to produce course certificates. The SVG files are then converted to PDFs using inkscape, because it was the only solution that I have found that works on Linux/Mac/Windows. If somebody wants to turn this into Python, maybe there are better solutions... ?

Usage:

1) prepare the file users.csv. Do not change the header since it will be used as keywords to replace in the svg template
2) run it with `. make_pdfs.sh`

All outputs are saved into subfolders. You can make your own templates based on "certificate.svg" (useful for example including signatures)
