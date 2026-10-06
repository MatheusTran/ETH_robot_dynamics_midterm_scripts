thisfile = which(mfilename);
exercisefolder = fileparts(thisfile);
cd(exercisefolder);
addpath(genpath(exercisefolder));
clear thisfile exercisefolder;
