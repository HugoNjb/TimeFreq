clearvars; close all;

%Load a GND for testing
FMUT_dir = 'C:\Users\ecfne\Documents\Eric\Coding\FMUT_development\FMUT';

%% GRP

load(fullfile(FMUT_dir, 'testing', 'data', 'Disflu_GroupLevel.GRP'), '-mat');

GRP = FmaxGRP(GRP, ... 
              'bins',             4:7, ... 
              'bg_factor_name',   'reliability', ...
              'wg_factor_names',  {'expectedness', 'disfluency'}, ...
              'wg_factor_levels', [2, 2], ...
              'time_wind',        [300, 500], ...
              'n_perm',           1e3, ...
              'save_GRP',         'no', ...
              'plot_raster',      'no');
          

mean_data_GRP = get_mean_amplitude(GRP, 1, 'effect', 'expectedness', 'output_file', 'outputs/testGRP.csv');


%% GND

load(fullfile(FMUT_dir, 'testing', 'data', 'EmProb_13subs_Test.GND'), '-mat');

GND = FmaxGND(GND, ...
              'bins',          [24, 26, 27, 29], ...
              'factor_names',  {'Probability', 'Emotion'}, ... 
              'factor_levels', [2, 2], ... 
              'n_perm',        1e3, ...
              'alpha',         0.05, ...
              'save_GND',      'no', ...
              'plot_raster',   'no');
          
mean_data_GND = get_mean_amplitude(GND, 1, 'effect', 'Emotion', 'output_file', 'outputs/testGND.csv');