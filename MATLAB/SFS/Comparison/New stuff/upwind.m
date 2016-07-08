%function V = upwind()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Program to check the effect of upwinding on   %
%           Discontinous Intensity function     %
%   Run : With upwinding                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

format long
close all
clear

global unew exactsol a b h

a = 0; b = 1;
N = 500;
h = (b-a)/N;

x = a+h:h:b-h;

u = zeros(N-1,1);
unew = zeros(N-1,1);
unew1  = zeros(N-1,1);
exactsol = zeros(N-1,1);

error = 100;
tol = 1e-6;

delt = h;
iterations = 0;

eps = 0;



while error > tol
    % i = 1
    Dxp = (u(2)-u(1))/h;
    Dxm = (u(1)-0)/h;
    D = godunov(Dxm,Dxp,a,x(1));
    
    unew(1) = u(1) - delt*(-exp(-2*u(1))+D-(eps*(u(2)-2*u(1))/h^2));
    
    
    
    for j=2:N-2
        Dxp = (u(j+1)-u(j))/h;
        Dxm = (u(j)-u(j-1))/h;
        D = godunov(Dxm,Dxp,x(j-1),x(j));
        unew(j) = u(j) - delt*(-exp(-2*u(j))+D - eps*(u(j-1)-2*u(j)+u(j+1))/h^2);
    
    end
    
    % i = N-1
    Dxp = (0-u(N-1))/h;
    Dxm = (u(N-1)-u(N-2))/h;
    
    D = godunov(Dxm,Dxp,x(N-2),x(N-1));
    unew(N-1) = u(N-1) - delt*(-exp(-2*u(N-1))+D - eps*(u(N-2)-2*u(N-1)+0.15)/h^2);
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Discontinuity capturing                      %

% % i = 2
%     if ((unew(3)-unew(2))*(unew(1)-0) < 0 )
%         unew(2) = max([unew(1),unew(2),unew(3)]);
%     end
% %i = 3:N-2
%     for i = 3:N-2
%         if ((unew(i+1)-unew(i))*(unew(i-1)-unew(i-2)) < 0)
%             unew(i) = max([unew(i-1),unew(i),unew(i+1)]);
%         end
%     end
%
% % i = N-1
%     if ((0-unew(N-1))*(unew(N-2)-unew(N-3)) < 0)
%         unew(N-1) = max([unew(N-1),0,unew(N-2)]);
%     end

%       for j = 2:N-2
%         if (abs(x(j)-0.4) < 1e-10 || abs(x(j)-0.6) < 1e-10)
%             unew(j) = min([unew(j),unew(j+1),unew(j-1)]);
%         end
%       end



    l2 = 0;
    for i = 1:N-1
        l2 = l2 + (unew(i)-u(i))^2;
    end
    l2 = h*sqrt(l2);
    error = l2;
    
        figure(2)
        plot(x,unew,'b.');
        %axis([a,b,0,0.3])
        pause(0.00001);
    
    iterations = iterations + 1;
    
    u = unew;
end
for i=1:N-1
    exactsol(i) = exact(x(i));
end
plot(x,unew,x,exactsol);
max(abs(unew-exactsol));
l2 = 0;
for i = 1:N-1
    l2 = l2 + (unew(i)-exactsol(i))^2;
end
l2 = h*sqrt(l2);
V = unew;
