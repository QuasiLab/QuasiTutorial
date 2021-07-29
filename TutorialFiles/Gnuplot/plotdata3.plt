# plotdata3.plt
reset
set terminal pdfcairo size 8cm,6cm font 'Helvetica,12'
set output 'plotdata3.pdf'
set style line 1 lt 1 lc 3 lw 2 pt 7 ps 1
set style line 2 lt 1 lc 1 lw 1 pt 5 ps 1
plot 'data3.dat' index 0 with linespoints ls 1, \
     'data3.dat' index 1 with linespoints ls 2
unset output