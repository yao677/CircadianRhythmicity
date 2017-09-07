%numeric simulation of the rhythmic production and rhythmic degradtion

%calculate the phase difference for constant degradation Adeg = 0


function newp=RhythmSimu(p)    %p is a structure containing parameters
format short;
%solve ode and calculate phase difference
sol=ode45(@dds,[0,p.t1],p.y0);
x=linspace(0,144,1000);
y=deval(sol,x);

%calculate the phase difference between production vector
%and the production-degradation-vector
index1 = y==max(y);   
z = p.k0 * (1+p.Aprod*cos(p.omega.*x-p.phip));
index2 = z==max(z);
deltap = x(index1)-x(index2);%presumably production-degradation phase is after production phase
%{
if deltap(1)<0
    deltap(1)=deltap(1)+24;
end
%}
p.deltap=deltap(1);
newp=p;

if outlier(p)
    h=figure;
    set(h,'Visible','off');
    plot(x,y,'k');
    name = num2str(p.deltap);
    name = strcat('phase_6_',name,'.fig');
    savefig(name);
end

function ds=dds(t,s)
%ODE of this simple system 
ds = p.k0 * (1+p.Aprod*cos(p.omega*t-p.phip)) - p.k1 * (1+p.Adeg*cos(p.omega*t-p.phid))*s;
end


end

%outlier plot of constant degradation if the phase difference is more than
%6 hour

function ifplot=outlier(p)
%p is the structure storing the parameters together with phase difference 

if abs(p.deltap) > 6
    ifplot=1;
else
    ifplot=0;
end
end
    


