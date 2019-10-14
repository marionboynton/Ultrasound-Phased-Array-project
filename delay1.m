
t = 1; %time
c = 343; %speed of sound in air
f = 40000; %frequency 
lambda = c/f; %wavelength
N=7;
w = 2*pi*f;

td =zeros(N); %delays 
k = 2*pi/lambda; % wave vector

F = [0.018 0 0.05];  %focal point

trans = [0, 0, 0; 
-0.0175, 0, 0;
-0.00875, 0.01516, 0;
0.00875, 0.01516, 0; 
0.0175, 0, 0; 
0.00875, -0.01516, 0; 
 -0.00875, -0.01516, 0];
 
dist = [];
val=0;
for k = 1:7
    for j =1:3
        val = val + (F(j) - trans(k,j))^ 2; %add squares of x y and z ditancess
    end
    dist(k) = sqrt(val); %square root to get ditance from transducer to focal point 
    val = 0;
end

mindist = min(dist);

td=[];
for i =1:7
    td(i) = (1/c)*(mindist-dist(i)); %time = dist/vel
end

if (min(td)<0)
    delays = td-min(td); %make positive 
else
    delays = td;
end

delays
