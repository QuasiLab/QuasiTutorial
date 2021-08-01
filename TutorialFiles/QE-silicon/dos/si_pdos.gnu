#set terminal pdfcairo enhanced color solid font "Arial,10" size 10in,6in
set terminal pdfcairo enhanced color solid font ",12" size 10in,6in
set output "si_pdos.pdf"

efermi=6.3289

set yzeroaxis
unset key
#set xrange [-8:15]
#set format y "%.0f"
set xlabel "{/Symbol e} (eV)"
set ylabel "PDOS"
set format y "%.1f"

set style fill solid 1.0 noborder
set style data filledcurves y1=0

plot "si.pdos_atm#1(Si)_wfc#2(p)" u ($1-efermi):3 w lines lw 3.0

