function [Cement_Vol] = volume_calculations (cement_properties)

% INPUT
% Volume Calculations
wc_ratio = cement_properties(1);
C3S_density = cement_properties(2);
C2S_density = cement_properties(3);
C3A_density = cement_properties(4);
C4AF_density = cement_properties(5);

% VOLUME & WEIGHT CALCULATIONS OF CEMENT
Total_volume = 100^3;
density_cement = (C3S_density + C2S_density + C3A_density + C4AF_density)/4;
Cement_Vol = (Total_volume*(1/density_cement))/((1/density_cement)+wc_ratio);

end