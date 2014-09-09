reset
set terminal epslatex color
set output 'UI.tex'
set xlabel 'Strom $I_1$ [A]'
set ylabel 'Spannung $U_1$ [V]'
set key top left

#set xrange[0:0.001]

f(x)=a*x+b

set fit logfile 'UI.log'
fit f(x) 'UI.dat' u 1:2 via a,b

p 'UI.dat' u 1:2 t'Messwerte' ,\
f(x) lt -1 t'Regressionsgerade'

set output
!epstopdf UI.eps
!rm UI.eps
