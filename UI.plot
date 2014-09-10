reset
set terminal epslatex color
set output 'UI.tex'
set xlabel 'Strom $I_1$ [mA]'
set ylabel 'Spannung $U_1$ [V]'
set key top left

p 'UI.dat' u 1:2:(0.5) w e t'Messwerte'

set output
!epstopdf UI.eps
!rm UI.eps
