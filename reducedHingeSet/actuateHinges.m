function [result, extrudedUnitCell, opt] = ...
    actuateHinges(hingeList, unitCell, extrudedUnitCell, opt)
% [result, extrudedUnitCell, opt] = actuateHinges(hingeList, opt)
% 
% Two-step optimiation with hinges specified in the hingeList closed.
% Also saves the the results and exitFlags in a .mat file, (and after
% uncommenting the final section, outputs an image of the final state).
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% INPUT
% hingeList - a list of hinges to be actuated at the same time
% unitCell
% extrudedUnitCell
% opt       - options
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% OUTPUT
% result           - final results from convergence
% extrudedUnitCell - updated extruded unit cell
% opt              - updated options
% ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
% last modified on Jun 05, 2017
% yun


if isempty(hingeList)
    result = [];
    return
end


actuationsList = [hingeList(:), -pi*0.985 * ones(length(hingeList), 1)];

opt.angleConstrFinal(1).val = actuationsList;
opt.options=optimoptions('fmincon','GradConstr','on','GradObj','on',...
    'tolfun',1e-5','tolx',1e-9,'tolcon',1e-5,'Display','off',...
    'DerivativeCheck','off','maxfunevals',100000);

[result, extrudedUnitCell, exitFlag1, exitFlag2, opt] = ...
    findDeformation(unitCell, extrudedUnitCell, opt);


% create folder if it doesn't exist
folderName = strcat(pwd, '/Results/', opt.template, '/mat/');
if ~exist(folderName, 'dir')
    mkdir(folderName);
end
fileName = strcat(folderName, 'hinge', mat2str(hingeList), '_exitflg',...
    mat2str([exitFlag1, exitFlag2]), '.mat');
save(fileName, 'result');
