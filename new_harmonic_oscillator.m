syms x(t) y(t) 
   ode1=diff(x) == y;
   ode2=diff(y)== -x;
   [x,y]=dsolve(ode1,ode2,x(0)==1,y(0)==0);
   
   fplot(subs(x),'r')
   hold on
   fplot(subs(y),'g')
   title('Harmonic oscillator')

legend('dx/dt=y(t)', 'dy/dt=-x(t)')