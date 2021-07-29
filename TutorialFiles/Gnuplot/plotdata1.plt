# plotdata1.plt
reset
set terminal pdfcairo size 8cm,6cm font 'Helvetica,12'
set output 'plotdata1.pdf'
set style line 1 lt 1 lc 3 lw 2 pt 7 ps 1
plot 'data1.dat' with linespoints ls 1
unset output