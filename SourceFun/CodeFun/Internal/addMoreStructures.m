function [params] = addMoreStructures(params, numToBeAdded)

originalL = length(params.s_lambda_sequence);
newL = originalL + numToBeAdded;
currentL = originalL;

wb = CmdLineProgressBar('Learning Structures'); %feedback
fprintf('\n');
while currentL < newL
    currentL=currentL+1;
    newSLambda = randsample(params.s_lambda_sequence_LASSO,1);
    params.s_lambda_sequence = [params.s_lambda_sequence newSLambda];
    [params.rawCoef{end+1}] = learn_structures(params,newSLambda); %learn structures at each s_lambda
    params.learned_structures{end+1} = processStructure(params.rawCoef{end},params.density,params.absolute); %binarize
    % determine if unique
    notUniqueFlag = []; %gross code i know...
    for i = 1:(length(params.rawCoef)-1)
        if isequal(params.learned_structures{i}, params.learned_structures{end})
            notUniqueFlag = [notUniqueFlag 1];
        else
            notUniqueFlag = [notUniqueFlag 0];
        end
    end
    
    if sum(notUniqueFlag)>0
        params.rawCoef(end)=[];
        params.learned_structures(end)=[];
        params.s_lambda_sequence(end)=[];
        currentL = currentL-1;
    end
    notUniqueFlag=[];
    wb.print(i,params.num_structures); %feedback update
end
fprintf('Structural Learning Complete');
fprintf('\n');

end
