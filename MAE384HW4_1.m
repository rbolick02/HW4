close all
clear
clc

% Data points
x = (0:0.1:0.7)';
y = [-1 -0.03 0.90 1.80 2.66 3.50 3.10 2.68]';
n = length(x);
m = 3;

for i=1:2*m
    xsum(i) = sum(x.^(i));
end
a(1,1) = n;
b(1,1) = sum(y);
for j = 2:m+1
    a(1,j)=xsum(j-1);
end
for i = 2:m+1
    for j = 1:m+1
        a(i,j)=xsum(j+i-2);
    end
    b(i,1) = sum(x.^(i-1).*y);
end
p = (a\b)';
for i = 1:m+1
    Pcoef(i)=p(m+2-i);
end

polyval(Pcoef, x);
ei = abs(polyval(Pcoef,x) - y);
Error = sum(ei.^2); % Part (c) - Error Calculation
X=0:0.01:0.7;
Y=polyval(Pcoef,X);
plot(X,Y)
hold on
grid on
plot(x,y,'o')

fprintf('Part (a)\n----------------------------------\n')

A = [x.^3 x.^2 x ones(size(x))];
B = A\y; % Solve the system
fprintf('Polynomial, p(x) = (%.4f)*x^3 + (%.4f)*x^2 + (%.4f)*x + (%.4f)\n', B)

fprintf('Part (c)\n----------------------------------\n')

Error