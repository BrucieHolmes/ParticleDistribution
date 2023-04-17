function [x1, y1] = particle_distribution_cement(R, num_part)

% 2D PARTICLE DISTRIBUTION

% Box size
Ls = 1000;
Ws = Ls;

% Position of largest particle
x1 = single(zeros(num_part,1));
y1 = single(zeros(num_part,1));

x1 = Ls/2;
y1 = Ws/2;

% Create non overlapping coordinates
% m = variable representing what "sphere" is being considered
m = 1;
% s = variable checking how many iterations attempted to insert a sphere
s = 0;
Rads = R(m,1);
% set the xMin, xMax etc. of the cube
xMin = 0;
xMax = Ls;
yMin = 0;
yMax = Ws;
% [q,r] = size(R);
%i = 1;
% Check overlapping
overlap = true;
for m = 2:num_part
   s=s+1;
   % reset our counter s (iterations of trying to insert sphere)
   while (overlap)
      % Create a random x1 between xmin and xmax 
      % Xm & Ym are random locations
      XmTrue = true;
      while XmTrue
      Xm = xMin+rand()*(xMax-xMin);
         if Xm < xMax || Xm > xMin
             XmTrue = false;
         end
      end
      YmTrue = true;
      while YmTrue
      Ym = yMin+rand()*(yMax-yMin); 
         if Ym < yMax || Ym > yMin
             YmTrue = false;
         end
      end

      if (m == 1)
         fprintf('Cement particles cannot overlap only one sphere\n');
      else % check for over lap
         overlap = particle_insertable([Xm Ym], R(m,1), [x1 y1], Rads, [xMax yMax]); 
          % Check current radius plus all previous radii lest than distance
%          if (~overlap)
%              fprintf('Cement particle can be inserted\n');
%          end
         if (s == 1E6)
             % s = counter controlling how many iterations to insert a sphere
             fprintf('After 1,000,000 iterations Cement particle cannot be inserted, Program ends');
             return;
         end
      end
   end
   x1 = [x1;Xm];
   y1 = [y1;Ym];
   Rads = R(1:m);
   overlap = true;
end

end