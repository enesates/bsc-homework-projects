input = [];
target = [];

% 25 person with 10 different  photos
for i=1:25
    for j=2:10       
        img = imread(strcat('faces/','s',mat2str(i),'/',mat2str(j),'.pgm'));
        img = imadjust(img); % histogram equalization
        img = double(img);
        COEFF = pcacov(img); % pcacov method for principal component analysis
		
        % first two rows is enough for ann
        firstrow = COEFF(:,1:1);
        firstrow = transpose(firstrow);
        secondrow = COEFF(:,2:2);
        secondrow = transpose(secondrow);
        tworows = [firstrow secondrow];
		
        % inputs and expected outputs
        input = [input transpose(tworows)];
        target(i,((i-1)*9)+j-1) = 1;
    end
end

% ann: MLP with rp, scg algorithms and different number of neuron 
net = newff (minmax(input) , [neuron, 25],{'logsig' 'purelin'} , algorithm );
net.trainParam.epochs = 1500; % number of iteration
net.trainparam.goal = 1e-5; % error ratio

% train to ann
net = train(net, input, target);

success = 0; % rate of success
% test to ann
for i = 1:25
    img = imread(strcat('faces/','s',mat2str(i),'/1.pgm'));
    img = imadjust(img); 
    img = double(img);
    
    COEFF = pcacov(img);
    firstrow = COEFF(:,1:1);
    firstrow = transpose(firstrow);
    secondrow = COEFF(:,2:2);
    secondrow = transpose(secondrow);
    tworows = [firstrow secondrow];
        
    testResult = sim(net, transpose(tworows));
  
    testResult = transpose(testResult);
    [C , bestResult] = max(testResult); 
	% max of test result is the best similarity
    
    if bestResult == i % for the rate of success
        success = success+1;
    end
end

% rate of success (percent)
success = success * 4;
