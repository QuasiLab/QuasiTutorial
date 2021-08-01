#set terminal pdfcairo enhanced color solid font "Arial,10" size 10in,6in
set terminal pdfcairo enhanced color solid font ",12" size 10in,6in
set output "si_dos.pdf"

efermi=6.3289

set yzeroaxis
unset key
#set xrange [-8:15]
#set format y "%.0f"
set xlabel "{/Symbol e} (eV)"
set ylabel "DOS"
set format y "%.1f"

set style fill solid 1.0 noborder
set style data filledcurves y1=0

plot "si.dos" u ($1-efermi):2 fs solid 1.0 lc rgb "red"

