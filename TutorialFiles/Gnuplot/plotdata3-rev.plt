# plotdata3.plt
reset
set terminal pdfcairo size 8cm,6cm font 'Helvetica,12'
set output 'plotdata3-rev.pdf'
set style line 1 lt 1 lc 3 lw 2 pt 7 ps 1
set style line 2 lt 1 lc 1 lw 1 pt 5 ps 1
set xlabel 'Waktu (bulan)'
set ylabel 'Pemasukan (juta rupiah)'
set title  'Keuangan Fulan vs. Fulanah'
plot 'data3.dat' index 0 title 'Fulan'   with linespoints ls 1, \
     'data3.dat' index 1 title 'Fulanah' with linespoints ls 2
unset output