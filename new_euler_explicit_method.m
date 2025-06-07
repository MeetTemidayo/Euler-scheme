clear
clc
L = input('Enter the value of lambda of your choice:  ');
f = @ (t,x) -L*x; % Equation to solve Numerically
f_exact = @(t) exp(-L*t);  % Analytical solution
t = input('Enter the initial value of t_initial:  ');
x = input('Enter the initial value of x(t):  ');
h = input('Enter the stepsize (h) :  ');
T = input('Enter the final value of t_final:  ');
Variables = {'t', 'x' 'ftx' , 'new_x'};
k = 1;
while T>=t
    fprintf('value of x at t=% is %f \n',t,x);
    ftx = f(t,x);
    newx = x+h*ftx;
    answer(k,:)=[t x ftx newx];
    k = k+1;
    t = t+h;
    x = newx;
end 
Resl = array2table(answer);
Resl.Properties.VariableNames(1:size(Resl,2)) = Variables;
fprintf('Output of x(%f)=%f \n',t,answer(end,2))

xtrue = exp(-L*t);
ERR = abs(xtrue - newx);
disp(['For epsilon with value: ', num2str(ERR)]);

plot(answer(:,1), answer(:,2))
hold on
title('Exact and approx solution of an ODE for any Lambda of your choice')
f_exact(answer(:,1))
plot(answer(:,1), f_exact(answer(:,1)))
legend('Approximate solution', 'Exact solution')

