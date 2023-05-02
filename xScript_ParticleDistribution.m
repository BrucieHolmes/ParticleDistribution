% *************************************************************************
% ********************** HYDCEM PARTICLE CURRENT **************************
% PROGRAMMED TO:
% USER-SPECIFIED PARTICLE WEIGHT DISTRIBUTION (PWD) AND CEMENT PROPERTIES 
% GENERATES A RANDOMLY DISPERSED PARTICLE SIZE DISTRIBUTION (PSD).

% THIS MODEL INCORPORATES MULTIPLE FUNCTIONS INCLUDING:
    % generate_PSD.m
    % particle_distribution_cement.m
    % particle_insertable.m
    % plotParticles.m

    % TEXT FILES:
    % particle_weight_distribution.txt
    % cement_properties.txt
    
%% **************************** READ INPUT DATA ***************************
clc; close all; clear all;
tic

% INPUT DATA FILES
load particle_weight_distribution.txt
load cement_properties.txt

%% ********************** PARTICLE SIZE DISTRIBUTION **********************
x = particle_weight_distribution(1,:);
y = particle_weight_distribution(2,:);

%% ************ VOLUME & WEIGHT CALCULATIONS OF CEMENT PHASES *************
[Cement_Vol] = volume_calculations (cement_properties);

%% **************** GENERATE A PARTICLE SIZE DISTRIBUTION *****************
[R, num_part] = generate_PSD (x, y, Cement_Vol);

%% *********************** 2D PARTICLE DISTRIBUTION ***********************
% CEMENT PARTICLE DISTRIBUTION
[x1, y1] = particle_distribution_cement (R, num_part);

toc
%% ******************************* PLOTTING *******************************
% ************************ 2D PARTICLE DISTRIBUTION ***********************
figure
cla
plotParticles([x1, y1], R(:),[0.25 0.25 0.25])
xlim([0 1000])
ylim([0 1000])
axis square
axis off
set(gca,'fontsize',10)

toc
% ************************* PARTICLE DISTRIBUTION *************************
figure
xaxis = x;
yaxis = y;
yaxisA = smooth(yaxis);
plot(xaxis,yaxisA,'r*-')
xlabel('Particle Diameter (µm)')
ylabel('Cumulative Weight Distribution')
title('Particle size distribution')
set(gca,'fontsize',10)
grid on

toc
% ********************************** END **********************************