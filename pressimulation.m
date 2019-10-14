clear;
clc;

x=-0.035:0.0175:0.035;
y=-0.035:0.001:0.035;
z =0:0.001:0.08;

%beam
% x=-0.05:0.001:0.05;
% y=-0.05:0.001:0.05;
% z =0:0.001:0.08;

[X, Y, Z] = ndgrid(x, y, z);
X = X(:); Y = Y(:); Z = Z(:); %make column vectors

t = 1; %time
c = 343; %speed of sound in air
f = 40000; %frequency
lambda = c/f; %wavelength
w = 2*pi*f;
k = 2*pi/lambda; % wave vector

delay = [0 0 0 0 0 0 0];
%[0.00002385 0 0.00000765 0.00002408 0.000033 0.00002408 0.00000765]; 
% [0.000008674 0 0 0 0 0 0];
% [0.00002184 0.00001365 0.00002855 0.00002855 0.00001365 0 0];


trans = [0, 0, 0; 
-0.0175, 0, 0;
-0.00875, 0.01516, 0;
0.00875, 0.01516, 0; 
0.0175, 0, 0; 
0.00875, -0.01516, 0; 
-0.00875, -0.01516, 0];

%cappedsphere
% trans = [0, 0, -0.009; 
% -0.015, 0, -0.004;
% 0.015, 0, -0.004;
% -0.0075, 0.013, -0.004; 
% -0.0075, -0.013, -0.004; 
% 0.0075, 0.013, -0.004; 
% 0.0075, -0.013, -0.004];

pV= [];
int= [];
for i = 1:length(X)
    pp=0;
    for t = 1:7
        pres=0;
        dist = transdis(X(i), Y(i), Z(i), trans(t,:));  %distance from trasducer
        pres = (1/dist)*(1/10)*cos(k*dist-w*(t-delay(t))); %(1/dist)*(1/10)*
        pp=pp + pres;
    end
    pV(i) = abs(pp);
    int(i) = (pp^2)/(2*1.2754*c);
end
pV = pV(:);
int = int(:);

% %BEAM
% beam = [];
% xb = [];
% yb = [];
% zb = [];
% 
% for i=1:length(pV)
%     if (pV(i)>15)
%         beam = [beam; pV(i)];
%         xb= [xb; X(i)];
%         yb= [yb; Y(i)];
%         zb= [zb; Z(i)];
%     end
% end

%pressure
figure
scatter3(X,Y,Z,30,pV,'filled')       
colorbar;
caxis([0 35])
pbaspect([2.7 1 1])
title('Pressure Plot');
xlabel('X'); ylabel('Y'); zlabel('Z')
hold on
scatter3(0, 0, 0.03,100, 'r', 'filled') 

%intensity

% figure
% scatter3(X,Y,Z,30,int,'filled')       
% colorbar;
% pbaspect([3 1 1])
% title('Intensity Plot');
% xlabel('X'); ylabel('Y'); zlabel('Z')

% %BEAM
% figure
% scatter3(xb,yb,zb,10,beam, 'filled')       
% colorbar;
% pbaspect([1 1 1])
% caxis([10 40])
% title('Beam');
% xlabel('X'); ylabel('Y'); zlabel('Z') 

function d = transdis(x, y, z, t)
    d = sum(([x y z]-t).^2).^0.5;
end

 
 