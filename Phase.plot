reset
set terminal epslatex color
set output 'Phase.tex'
set xlabel 'Strom $I_2$ [A]'
set ylabel 'Phasenwinkel $\phi$ [Grad]'
set key top left

#set xrange[0:0.001]

f(x)=1

p 'Phase.dat' u 1:(2*arccos($3/$2/2)) t'Messwerte' ,\
f(x) lt -1 t'theoretisch erwarteter Verlauf'

set output
!epstopdf Phase.eps
!rm Phase.eps
