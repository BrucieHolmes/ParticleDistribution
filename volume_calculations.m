function [Cement_Vol] = volume_calculations (cement_properties)

% INPUT
% Volume Calculations
box_size = cement_properties(1);
wc_ratio = cement_properties(2);
C3S_density = cement_properties(3);
C2S_density = cement_properties(4);
C3A_density = cement_properties(5);
C4AF_density = cement_properties(6);

% VOLUME & WEIGHT CALCULATIONS OF CEMENT
Total_volume = box_size^3;
density_cement = (C3S_density + C2S_density + C3A_density + C4AF_density)/4;
Cement_Vol = (Total_volume*(1/density_cement))/((1/density_cement)+wc_ratio);

end