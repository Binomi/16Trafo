reset
set terminal epslatex color
set output 'Phase.tex'
set xlabel 'Strom $I_2$ [A]'
set ylabel 'Phasenwinkel $\phi$ [rad]'
set key top left

#set xrange[0:0.001]

f(x)=1

p 'Phase.dat' u 1:(2*acos($3/$2/2)) t'Messwerte' ,\
'' u 1:($4/180*pi) t 'Messwerte Oszi',\
f(x) lt -1 t'theoretisch erwarteter Verlauf'

set output
!epstopdf Phase.eps
!rm Phase.eps
