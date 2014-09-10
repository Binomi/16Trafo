reset
set terminal epslatex color
set output 'uebersetzung.tex'
set xlabel 'Spannung $U_1$ [V]'
set ylabel 'Spannung $U_2$ [V]'
set key top left

#set xrange[0:0.001]

f(x)=a*x
g(x)=c*x

set fit logfile 'uebersetzung1.log'
fit f(x) 'uebersetzung1.dat' u 1:2 via a
set fit logfile 'uebersetzung2.log'
fit g(x) 'uebersetzung2.dat' u 2:1 via c

p 'uebersetzung1.dat' u 1:2:(0.01) w e t'Messwerte' ,\
f(x) lt -1 t'Regressionsgerade',\
'uebersetzung2.dat' u 2:1:(0.1) w xe t'Messwerte' ,\
g(x) lt 0 t'Regressionsgerade'

set output
!epstopdf uebersetzung.eps
!rm uebersetzung.eps
