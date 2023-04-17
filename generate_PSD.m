function [R, num_part] = generate_PSD (x, y, Cement_Vol)

% THIS FUNCTION GENERATES A PARTICLE SIZE DISTRIBUTION
Diameter(1) = x(1);
Volume(1) = (4/3)*pi*((Diameter(1)/2)^3);
Vol_remaining(1) = Cement_Vol-Volume(1);
Vol_fraction_remaining(1) = Vol_remaining(1)/Cement_Vol;
Radius(1) = Diameter(1)/2;
i = 1;

while Vol_remaining(i) > 0
    i = i+1;
    Diameter(i) = interp1 (y, x, Vol_fraction_remaining(i-1));
    Volume(i) = (4/3)*pi*((Diameter(i)/2)^3);
    Vol_remaining(i) = Cement_Vol-(sum(Volume(1:i)));
    Vol_fraction_remaining(i) = Vol_remaining(i)/Cement_Vol;
    Radius(i) = Diameter(i)/2;
end

R = Radius';
num_part = size(R,1);

ave_cem_radius = mean(R);

end