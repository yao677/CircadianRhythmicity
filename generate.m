%produce parameters for the testing of constant degradation

function p=generate()                  %generate parameters stored in a vector of struct

AP = 0.1:0.1:1;                   %mean amplitude of production oscillation
%p.Adeg = 0;                            %mean amplitude of degradation oscillation
ls = logspace(-3,3,7);                 %mean reaction rate magnitude vector
%p.k0=ls;                               %randomly select a magnitutde for production rate constant
%p.k1=ls;                               %randomly select a magnitutde for degradation rate constant
%p.omega = 2*pi/24;                     %default 24h period
%p.phip = 0;                            %set the production vector phase to be 0
%p.phid = 0;                       %degradation vector phase

record=1;
for a=AP
    for b=ls 
        for k=ls
            p(record).Aprod=a;
            p(record).k0=b;
            p(record).k1=k;
            p(record).omega=2*pi/24;
            p(record).Adeg=0;
            p(record).phip=0;
            p(record).phid=6;
            p(record).t1=500;
            p(record).y0=0;
            record=record+1;
        end
    end
end    
end