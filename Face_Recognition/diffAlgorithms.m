% train to the ann with 2 different algorithms that are rp and scg
neurons = [];
successes = [];

algorithm = 'trainrp';
diffNeurons;

neuronsRp = neurons;
successesRp = successes;


neurons = [];
successes = [];

algorithm = 'trainscg';
diffNeurons;

neuronsScg = neurons;
successesScg = successes;

display(neuronsRp);
display(successesRp);
display(neuronsScg);
display(successesScg);
