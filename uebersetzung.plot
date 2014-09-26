reset
set terminal epslatex color
set output 'uebersetzung.tex'
set xlabel 'Spannung $U_2$ [V]'
set ylabel 'Spannung $U_1$ [V]'
set key top left

#set xrange[0:0.001]

f(x)=a*x
g(x)=c*x

set fit logfile 'uebersetzung1.log'
fit f(x) 'uebersetzung1.dat' u 2:1 via a
set fit logfile 'uebersetzung2.log'
fit g(x) 'uebersetzung2.dat' u 1:2 via c

p 'uebersetzung1.dat' u 2:1:(0.01) w xe t'Messwerte $U_2(U_1)$' ,\
f(x) lt -1 t'zugeh. Regressionsgerade',\
'uebersetzung2.dat' u 1:2:(0.1) w e t'Messwerte U_1(U_2)' ,\
g(x) lt 0 t'zugeh. Regressionsgerade'

set output
!epstopdf uebersetzung.eps
!rm uebersetzung.eps
