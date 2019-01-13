% feature extraction with pcacov method
featureExtraction = 'recWithPcaCov';

% use two algorithms that are rp and scg
diffAlgorithms;

% save to number of neurons and their successes
save('PcaCov.mat','neuronsRp','successesRp','neuronsScg','successesScg');
PcaCov = load('PcaCov');

% drawing neurons with their successes as graphic
plot(PcaCov.neuronsRp, PcaCov.successesRp, '-o',PcaCov.neuronsScg, PcaCov.successesScg,'-o');
xlabel('Neurons');
ylabel('Success');
title('Rp and Scg Algorithm with Different Neuron Size');
legend('Rp Algorithm','Scg Algorithm');


