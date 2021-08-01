#!/bin/bash
# Explore the effect of an increasing Monhorst-Pack grid and cutoff energy
#############

name='Si.k-point'

#############
for s in 0 1; do
for n in 1 2 3 4 5 6 7 8 9 10; do

cat > $name.$s.$n.in << EOF
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
 ecutwfc=60.0,
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

pw.x <$name.$s.$n.in>$name.$s.$n.out

awk '/\!/ {E=$5} $1=="PWSCF" {printf"%3d%3d %s %s\n",'$n','$s',E,$3}' $name.$s.$n.out >> calc-mp.dat

done
done
