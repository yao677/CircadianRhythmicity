# Goal 1: 6 hour latency

## ODE of this simple system 
ds = p.k0 * (1+p.Aprod*cos(p.omega*t-p.phip)) - p.k1 * (1+p.Adeg*cos(p.omega*t-p.phid))*s;

parameter setting:
p.k0 and p.k1 parameterized using "logspace(-3,3,7)"
p.Adeg = 0 (constant degradation)
p.prod = 0.1:0.1:1
p.omega = 2*pi/24
initial product concentration y0 = 0
ending time point p.t1 = 500
## Solution and analysis of this ODE
sol=ode45(@dds,[0,p.t1],p.y0);
x=linspace(120,144,1000);  
y=deval(sol,x);
### Calculate the peak difference
Search x for biggest y in order to calculate the phase difference
index1 = y==max(y);
z = p.k0 * (1+p.Aprod*cos(p.omega.*x-p.phip))
index2 = z==max(z);
deltap = x(index2)-x(index1)

Phase differences longer than 6 hour are treated as outliers and plots are plotted

####p.phip = 0, p.phid = 6

![phase_21.7658](C:\Users\YXYJULY\Desktop\Project\phase_21.7658.jpg)

![phase_22.967](C:\Users\YXYJULY\Desktop\Project\phase_22.967.jpg)