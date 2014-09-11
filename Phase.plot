reset
set terminal epslatex color
set output 'Phase.tex'
set xlabel 'Strom $I_2$ [A]'
set ylabel 'Phasenwinkel $\phi$ [rad]'
set key top left

set xrange[-0.2:5.5]
set yrange[-0.1:*]

u=0.096573576255684176
I0=0.15
phi0=0.5*pi#86.5/180*pi#1.41551514174
f(x)=atan(I0*sin(phi0)/(x*u+I0*cos(phi0)))

p 'Phase.dat' u 1:(2*acos(($3/$2)/2.0)) t'Messwerte' ,\
'' u 1:($4/180*pi):(2/180*pi) w e t 'Messwerte Oszi',\
'lissajous.dat' u 1:2:3 w e t'Lissajous',\
f(x) / (x>0) lt -1 t'theoretisch erwarteter Verlauf'

set output
!epstopdf Phase.eps
!rm Phase.eps
