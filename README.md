scantopdf
=========

Quick and dirty script for converting scanned PNGs into a PDF.
Final resolution is 118dpi. Don't ask, 'cos I don't know.

Details
=======

I'm busily scanning an old A5 technical manual for ACT Apricot machines, to
preserve it. I'm scanning the book at 600dpi into high-resolution but low-
colour-count PNGs - great for storing, not so great for sharing.
This script takes those PNGs, resizes them to 50% of their original size, saves
them as JPEG images, converts those JPEGs to PDF files and then creates a
single optimised PDF before deleting the JPEG and intermediate PDF files.
Why? Because "convert 1.png 2.png 3.png output.pdf" works fine for three PNGs,
but have you ever tried it on three hundred? Watch your memory usage SKYROCKET
as ImageMagick loads EVERY SINGLE GODDAMN IMAGE INTO MEMORY AT THE SAME TIME.
Eventually, unless you've got scads of RAM spare, your system will exhaust both
real and virtual memory, at which point ImageMagick will be killed and no file
created. This little script fixes all that.
Oh, but unless you're *also* scanning an A5 book at 600dpi into PNG format,
you'll probably want to do a little modification here and there.

Dependencies
============
Bash, ImageMagick, GhostScript.
