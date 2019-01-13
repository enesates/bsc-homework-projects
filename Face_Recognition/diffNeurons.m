% train to the ann with 5 different number of neurons
for i=1:5
    neuron = 25*i;
    if strcmp(featureExtraction,'recWithPcaCov') == 1;
        recWithPcaCov;
    else recWithSift;
    end
    neurons = [neurons neuron];
    successes = [successes success];
end

