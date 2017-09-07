%batch_run of RhythmSimu

p=generate();   %parameter sets for test
size = length(p);
result(size) = RhythmSimu(p(size));
for i=1:size
    result(i)= RhythmSimu(p(i));
end
phase=zeros(1,length(result));
for j=1:length(result)
    phase(j)=result(j).deltap;
end




fprintf('The range of phase latency is from %f to %f\n',min(phase),max(phase));