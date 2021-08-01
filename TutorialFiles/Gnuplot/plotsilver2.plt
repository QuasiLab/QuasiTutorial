# plotsilver.plt
reset
set terminal pdfcairo size 8cm,6cm font 'Helvetica,12'
set output 'plotsilver.pdf'
set style line 1 lt 1 lc rgb 'blue'  lw 1.5 pt 7 ps 0.5
set style line 2 lt 1 lc rgb 'red'   lw 1.5
set style line 3 lt 5 lc rgb 'green' lw 1.5
set xlabel 'Waktu (detik)'
set ylabel 'Laju Peluruhan'
set title  'Data Laju Peluruhan Ag-108'
# rentang sumbu
set xrange [0:250]
set yrange [0:300]
set mxtics 5
set mytics 5 
# rentang fitting:
set samples 300,300
# fungsi matematis:
T(x) = 12.6 + 313*exp(-x/42.7)
# plot data, fitting, dan fungsi:
plot 'silver.dat' title 'Data Eksperimen' with errorb    ls 1, \
     'silver.dat' title 'Bezier Fitting' smooth sbezier  ls 2, \
     T(x)         title 'Fungsi Tebakan'  with lines     ls 3
unset output