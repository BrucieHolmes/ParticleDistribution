function [a] = particle_insertable( xyc, Rc, xy, R, xyMax, percentOverlap)
   
   if(nargin == 5)
      percentOverlap = 0;
   end
   
   DistanceBetweenSpheres = sqrt((xy(:,1)- xyc(1)).^2 + (xy(:,2)- xyc(2)).^2);
   RadiusPairDistance = R + Rc;
   allowOverlap = Rc * percentOverlap * 0.01;
   delta = DistanceBetweenSpheres - RadiusPairDistance + allowOverlap;
   overlap = any(delta < 0);
   if (overlap)
       %k = delta<0;
       %b = delta(k)-allowOverlap;
       %fprintf('Overlapping by: %3.0f %%\n', -min(b)*100/Rc);
      a = overlap;
      return;
   end
   
   edgeGaps = [xyc-Rc xyMax-xyc-Rc]; 
   outsideEdge = any(edgeGaps < 0);
   a = outsideEdge;
end
