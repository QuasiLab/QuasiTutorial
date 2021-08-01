#!/bin/bash
# Explore the effect of an increasing Monhorst-Pack grid and cutoff energy
#############

name='Si.ecut'

#############
n=9; s=1;

for ecut in 4 6 8 10 12 14 18 20 24 28 32 36 40 44 \
	    48 52 56 60 70 80 100; do

cat > $name.$ecut.in << EOF
&CONTROL
 calculation='scf',
 restart_mode='from_scratch',
 prefix='si',
 pseudo_dir='../pseudo/',
 outdir='../tmp/',
/
&SYSTEM
 ibrav=2,
 celldm(1)=10.2625,
 nat=2,
 ntyp=1,
 ecutwfc=${ecut},
 ecutrho=720.0,
/
&ELECTRONS
 mixing_beta=0.7,
 conv_thr=1d-8,
/
ATOMIC_SPECIES
 Si 28.0855 Si.pbe-rrkj.UPF
ATOMIC_POSITIONS (alat)
Si  0.00  0.00  0.00
Si  0.25  0.25  0.25
K_POINTS automatic
${n} ${n} ${n} ${s} ${s} ${s}
EOF

pw.x <$name.$ecut.in>$name.$ecut.out

awk '/\!/ {E=$5} $1=="PWSCF" {printf"%4d %s %s\n",'$ecut',E,$3}' $name.$ecut.out >> calc-ecut.dat

done
