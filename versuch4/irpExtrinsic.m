%
% irpExtrinsic calculates the extrinsic parameters of a calibration plane
% depending on the selection of 4 points on the plane.
%
% Usage: CTW = irpExtrinsic(I,calib_dist,fc,cc,kc)
%
% The origin of the corresponding world coordinate system lies in the first
% selected point, the y-axis points towards the second selected point.
%
% Returns the matrix
%              | r11 r12 r13 t1 |
%       CTW =  | r21 r22 r23 t2 |
%              | r31 r32 r33 t3 |
%              |  0   0   0   1 |
% which transforms points in world (calibration) coordinates x_w to
% camera coordinates x_c with equation x_c = CTW*x_w.
%
% Needed variables:
%   I: camera image of calibration plane (with 4 calibration points)
%   calib_dist = [dx dy]: distance of calibration points in x and y direction
%   From matlab camera calibration toolbox:
%       f: camera focal length
%       cc = [cx cy]: camera principal point
%       kc: camera distortion parameters
%

function CTW = irpExtrinsic(I,calib_dist,f,s,cc,kc)

fc = [f;f*s(2)];

%%% EXTRACT GRID CORNERS:

dx = calib_dist(1);
dy = calib_dist(2);

wintx = 5;
winty = 5;
alpha_c = 0;

if size(I,3)>1,
    I = rgb2gray(I);
end

[x_ext,X_ext] = extract_grid_intern(double(I),wintx,winty,fc,cc,kc,dx,dy,[],[],0);


%%% Computation of the Extrinsic Parameters attached to the grid:

[omc_ext,Tc_ext,Rc_ext,H_ext] = compute_extrinsic(x_ext,X_ext,fc,cc,kc,alpha_c);

CTW = [Rc_ext,Tc_ext;0 0 0 1];

end



function [x,X] = extract_grid_intern(I,wintx,winty,fc,cc,kc,dX,dY,xr,yr,click_mode)

map = gray(256);

minI = min(I(:));
maxI = max(I(:));

Id = 255*(I - minI)/(maxI - minI);

figure(2);
image(Id);
colormap(map);

if ~isempty(xr);
    figure(2);
    hold on;
    plot(xr,yr,'go');
    hold off;
end;

need_to_click = 1;

color_line = 'g';

while need_to_click,
    
    title('Click on the four corners of the rectangular pattern (first corner = origin)...');
    
    x= [];y = [];
    figure(2); hold on;
    for count = 1:4,
        [xi,yi] = ginput4(1);
        [xxi] = cornerfinder([xi;yi],I,winty,wintx);
        xi = xxi(1);
        yi = xxi(2);
        figure(2);
        plot(xi,yi,'+','color',[ 1.000 0.314 0.510 ],'linewidth',2);
        plot(xi + [wintx+.5 -(wintx+.5) -(wintx+.5) wintx+.5 wintx+.5],yi + [winty+.5 winty+.5 -(winty+.5) -(winty+.5)  winty+.5],'-','color',[ 1.000 0.314 0.510 ],'linewidth',2);
        x = [x;xi];
        y = [y;yi];
        plot(x,y,'-','color',[ 1.000 0.314 0.510 ],'linewidth',2);
        drawnow;
    end;
    plot([x;x(1)],[y;y(1)],'-','color',[ 1.000 0.314 0.510 ],'linewidth',2);
    drawnow;
    hold off;
    
    [Xc,good,bad,type] = cornerfinder([x';y'],I,winty,wintx); % the four corners
    
    x = Xc(1,:)';
    y = Xc(2,:)';
    
    
    % Sort the corners:
    x_mean = mean(x);
    y_mean = mean(y);
    x_v = x - x_mean;
    y_v = y - y_mean;
    
    theta = atan2(-y_v,x_v);
    [junk,ind] = sort(theta);
    
    [junk,ind] = sort(mod(theta-theta(1),2*pi));
    
    %ind = ind([2 3 4 1]);
    
    ind = ind([4 3 2 1]); %-> New: the Z axis is pointing uppward
    
    
    x = x(ind);
    y = y(ind);
    x1= x(1); x2 = x(2); x3 = x(3); x4 = x(4);
    y1= y(1); y2 = y(2); y3 = y(3); y4 = y(4);
    
    
    % Find center:
    p_center = cross(cross([x1;y1;1],[x3;y3;1]),cross([x2;y2;1],[x4;y4;1]));
    x5 = p_center(1)/p_center(3);
    y5 = p_center(2)/p_center(3);
    
    % center on the X axis:
    x6 = (x3 + x4)/2;
    y6 = (y3 + y4)/2;
    
    % center on the Y axis:
    x7 = (x1 + x4)/2;
    y7 = (y1 + y4)/2;
    
    % Direction of displacement for the X axis:
    vX = [x6-x5;y6-y5];
    vX = vX / norm(vX);
    
    % Direction of displacement for the X axis:
    vY = [x7-x5;y7-y5];
    vY = vY / norm(vY);
    
    % Direction of diagonal:
    vO = [x4 - x5; y4 - y5];
    vO = vO / norm(vO);
    
    delta = 30;
    
    
    figure(2); image(Id);
    colormap(map);
    hold on;
    plot([x;x(1)],[y;y(1)],'g-');
    plot(x,y,'og');
    hx=text(x6 + delta * vX(1) ,y6 + delta*vX(2),'X');
    set(hx,'color','g','Fontsize',14);
    hy=text(x7 + delta*vY(1), y7 + delta*vY(2),'Y');
    set(hy,'color','g','Fontsize',14);
    hO=text(x4 + delta * vO(1) ,y4 + delta*vO(2),'O','color','g','Fontsize',14);
    hold off;
  
    n_sq_x = 1;
    n_sq_y = 1;
        
    need_to_click = 0;
        
    
    color_line = 'r';
    
end


% Compute the inside points through computation of the planar homography (collineation)

a00 = [x(1);y(1);1];
a10 = [x(2);y(2);1];
a11 = [x(3);y(3);1];
a01 = [x(4);y(4);1];


% Compute the planar collineation: (return the normalization matrice as well)

[Homo,Hnorm,inv_Hnorm] = compute_homography([a00 a10 a11 a01],[0 1 1 0;0 0 1 1;1 1 1 1]);


% Build the grid using the planar collineation:

x_l = ((0:n_sq_x)'*ones(1,n_sq_y+1))/n_sq_x;
y_l = (ones(n_sq_x+1,1)*(0:n_sq_y))/n_sq_y;
pts = [x_l(:) y_l(:) ones((n_sq_x+1)*(n_sq_y+1),1)]';

XX = Homo*pts;
XX = XX(1:2,:) ./ (ones(2,1)*XX(3,:));


% Complete size of the rectangle

W = n_sq_x*dX;
L = n_sq_y*dY;

    
xy_corners_undist = comp_distortion_oulu([(x' - cc(1))/fc(1);(y'-cc(2))/fc(2)],kc);
    
xu = xy_corners_undist(1,:)';
yu = xy_corners_undist(2,:)';
    
[XXu] = projectedGrid ( [xu(1);yu(1)], [xu(2);yu(2)],[xu(3);yu(3)], [xu(4);yu(4)],n_sq_x+1,n_sq_y+1); % The full grid
    
r2 = sum(XXu.^2);       
XX = (ones(2,1)*(1 + kc(1) * r2 + kc(2) * (r2.^2))) .* XXu;
XX(1,:) = fc(1)*XX(1,:)+cc(1);
XX(2,:) = fc(2)*XX(2,:)+cc(2);
    

Np = (n_sq_x+1)*(n_sq_y+1);


grid_pts = cornerfinder(XX,I,winty,wintx); %%% Finds the exact corners at every points!

grid_pts = grid_pts - 1; % subtract 1 to bring the origin to (0,0) instead of (1,1) in matlab (not necessary in C)

ind_corners = [1 n_sq_x+1 (n_sq_x+1)*n_sq_y+1 (n_sq_x+1)*(n_sq_y+1)]; % index of the 4 corners
ind_orig = (n_sq_x+1)*n_sq_y + 1;
xorig = grid_pts(1,ind_orig);
yorig = grid_pts(2,ind_orig);
dxpos = mean([grid_pts(:,ind_orig) grid_pts(:,ind_orig+1)]');
dypos = mean([grid_pts(:,ind_orig) grid_pts(:,ind_orig-n_sq_x-1)]');


ind_x = (n_sq_x+1)*(n_sq_y + 1);
ind_y = 1;

x_box_kk = [grid_pts(1,:)-(wintx+.5);grid_pts(1,:)+(wintx+.5);grid_pts(1,:)+(wintx+.5);grid_pts(1,:)-(wintx+.5);grid_pts(1,:)-(wintx+.5)];
y_box_kk = [grid_pts(2,:)-(winty+.5);grid_pts(2,:)-(winty+.5);grid_pts(2,:)+(winty+.5);grid_pts(2,:)+(winty+.5);grid_pts(2,:)-(winty+.5)];


Xi = reshape(([0:n_sq_x]*dX)'*ones(1,n_sq_y+1),Np,1)';
Yi = reshape(ones(n_sq_x+1,1)*[n_sq_y:-1:0]*dY,Np,1)';
Zi = zeros(1,Np);

Xgrid = [Xi;Yi;Zi];


% All the point coordinates (on the image, and in 3D) - for global optimization:

x = grid_pts;
X = Xgrid;

close all

end % extract_grid_intern

% 
% function [omckk,Tckk,Rckk,H,x,ex,JJ] = compute_extrinsic_intern(x_kk,X_kk,fc,cc,kc,alpha_c,MaxIter,thresh_cond)
% 
% %compute_extrinsic
% %
% %[omckk,Tckk,Rckk,H,x,ex] = compute_extrinsic(x_kk,X_kk,fc,cc,kc,alpha_c)
% %
% %Computes the extrinsic parameters attached to a 3D structure X_kk given its projection
% %on the image plane x_kk and the intrinsic camera parameters fc, cc and kc.
% %Works with planar and non-planar structures.
% %
% %INPUT: x_kk: Feature locations on the images
% %       X_kk: Corresponding grid coordinates
% %       fc: Camera focal length
% %       cc: Principal point coordinates
% %       kc: Distortion coefficients
% %       alpha_c: Skew coefficient
% %
% %OUTPUT: omckk: 3D rotation vector attached to the grid positions in space
% %        Tckk: 3D translation vector attached to the grid positions in space
% %        Rckk: 3D rotation matrices corresponding to the omc vectors
% %        H: Homography between points on the grid and points on the image plane (in pixel)
% %           This makes sense only if the planar that is used in planar.
% %        x: Reprojections of the points on the image plane
% %        ex: Reprojection error: ex = x_kk - x;
% %
% %Method: Computes the normalized point coordinates, then computes the 3D pose
% %
% %Important functions called within that program:
% %
% %normalize_pixel: Computes the normalize image point coordinates.
% %
% %pose3D: Computes the 3D pose of the structure given the normalized image projection.
% %
% %project_points.m: Computes the 2D image projections of a set of 3D points
% 
% 
% 
% if nargin < 8,
%    thresh_cond = inf;
% end;
% 
% 
% if nargin < 7,
%    MaxIter = 20;
% end;
% 
% 
% if nargin < 6,
%    alpha_c = 0;
% 	if nargin < 5,
%    	kc = zeros(5,1);
%    	if nargin < 4,
%       	cc = zeros(2,1);
%       	if nargin < 3,
%          	fc = ones(2,1);
%          	if nargin < 2,
%             	error('Need 2D projections and 3D points (in compute_extrinsic.m)');
%             	return;
%          	end;
%       	end;
%    	end;
% 	end;
% end;
% 
% % Initialization:
% 
% [omckk,Tckk,Rckk] = compute_extrinsic_init(x_kk,X_kk,fc,cc,kc,alpha_c);
% 
% % Refinement:
% [omckk,Tckk,Rckk,JJ] = compute_extrinsic_refine(omckk,Tckk,x_kk,X_kk,fc,cc,kc,alpha_c,MaxIter,thresh_cond);
% 
% 
% % computation of the homography (not useful in the end)
% 
% H = [Rckk(:,1:2) Tckk];
% 
% % Computes the reprojection error in pixels:
% 
% x = project_points2(X_kk,omckk,Tckk,fc,cc,kc,alpha_c);
% 
% ex = x_kk - x;
% 
% 
% % Converts the homography in pixel units:
% 
% KK = [fc(1) alpha_c*fc(1) cc(1);0 fc(2) cc(2); 0 0 1];
% 
% H = KK*H;
% 
% end
% 
% 
% function [xc,good,bad,type] = cornerfinder_intern(xt,I,wintx,winty,wx2,wy2)
% 
% %[xc] = cornerfinder(xt,I);
% %
% %Finds the sub-pixel corners on the image I with initial guess xt
% %xt and xc are 2xN matrices. The first component is the x coordinate
% %(horizontal) and the second component is the y coordinate (vertical)
% % 
% %Based on Harris corner finder method
% %
% %Finds corners to a precision below .1 pixel!
% %Oct. 14th, 1997 - UPDATED to work with vertical and horizontal edges as well!!!
% %Sept 1998 - UPDATED to handle diverged points: we keep the original points
% %good is a binary vector indicating wether a feature point has been properly
% %found.
% %
% %Add a zero zone of size wx2,wy2
% %July 15th, 1999 - Bug on the mask building... fixed + change to Gaussian mask with higher
% %resolution and larger number of iterations.
% 
% 
% % California Institute of Technology
% % (c) Jean-Yves Bouguet -- Oct. 14th, 1997
% 
% 
% 
% line_feat = 1; % set to 1 to allow for extraction of line features.
% 
% xt = xt';
% xt = fliplr(xt);
% 
% 
% if nargin < 4,
%    winty = 5;
%    if nargin < 3,
%       wintx = 5;
%    end;
% end;
% 
% 
% if nargin < 6,
%    wx2 = -1;
%    wy2 = -1;
% end;
% 
% 
% %mask = ones(2*wintx+1,2*winty+1);
% mask = exp(-((-wintx:wintx)'/(wintx)).^2) * exp(-((-winty:winty)/(winty)).^2);
% 
% 
% % another mask:
% [X,Y] = meshgrid(-winty:winty,-wintx:wintx);
% mask2 = X.^2 + Y.^2;
% mask2(wintx+1,winty+1) = 1;
% mask2 = 1./mask2;
% %mask - mask2;
% 
% 
% if (wx2>0) & (wy2>0),
%    if ((wintx - wx2)>=2)&((winty - wy2)>=2),
%       mask(wintx+1-wx2:wintx+1+wx2,winty+1-wy2:winty+1+wy2)= zeros(2*wx2+1,2*wy2+1);
%    end;
% end;
% 
% offx = [-wintx:wintx]'*ones(1,2*winty+1);
% offy = ones(2*wintx+1,1)*[-winty:winty];
% 
% resolution = 0.005;
% 
% MaxIter = 10;
% 
% [nx,ny] = size(I);
% N = size(xt,1);
% 
% xc = xt; % first guess... they don't move !!!
% 
% type = zeros(1,N);
% 
% 
% for i=1:N,
%    
%    v_extra = resolution + 1; 		% just larger than resolution
%    
%    compt = 0; 				% no iteration yet
%    
%    while (norm(v_extra) > resolution) & (compt<MaxIter),
%       
%       cIx = xc(i,1); 			%
%       cIy = xc(i,2); 			% Coords. of the point
%       crIx = round(cIx); 		% on the initial image
%       crIy = round(cIy); 		%      
%       itIx = cIx - crIx; 		% Coefficients
%       itIy = cIy - crIy; 		% to compute
%       if itIx > 0, 			% the sub pixel
% 	 vIx = [itIx 1-itIx 0]'; 	% accuracy.
%       else
% 	 vIx = [0 1+itIx -itIx]';
%       end;
%       if itIy > 0,
% 	 vIy = [itIy 1-itIy 0];
%       else
% 	 vIy = [0 1+itIy -itIy];
%       end;
% 
%       
%       % What if the sub image is not in?
%       
%       if (crIx-wintx-2 < 1), xmin=1; xmax = 2*wintx+5;
%       elseif (crIx+wintx+2 > nx), xmax = nx; xmin = nx-2*wintx-4;
%       else
% 	 xmin = crIx-wintx-2; xmax = crIx+wintx+2;
%       end;
% 
%       if (crIy-winty-2 < 1), ymin=1; ymax = 2*winty+5;
%       elseif (crIy+winty+2 > ny), ymax = ny; ymin = ny-2*winty-4;
%       else
% 	 ymin = crIy-winty-2; ymax = crIy+winty+2;
%       end;
%       
%       
%       SI = I(xmin:xmax,ymin:ymax); % The necessary neighborhood
%       SI = conv2(conv2(SI,vIx,'same'),vIy,'same');
%       SI = SI(2:2*wintx+4,2:2*winty+4); % The subpixel interpolated neighborhood
%       [gy,gx] = gradient(SI); 		% The gradient image
%       gx = gx(2:2*wintx+2,2:2*winty+2); % extraction of the useful parts only
%       gy = gy(2:2*wintx+2,2:2*winty+2); % of the gradients
%       
%       px = cIx + offx;
%       py = cIy + offy;
%       
%       gxx = gx .* gx .* mask;
%       gyy = gy .* gy .* mask;
%       gxy = gx .* gy .* mask;
%    
%       
%       bb = [sum(sum(gxx .* px + gxy .* py)); sum(sum(gxy .* px + gyy .* py))];
%       
%       a = sum(sum(gxx));
%       b = sum(sum(gxy));
%       c = sum(sum(gyy));
%       
%       dt = a*c - b^2;
%       
%       xc2 = [c*bb(1)-b*bb(2) a*bb(2)-b*bb(1)]/dt;
%       
%       
%       %keyboard;
%       
%       if line_feat,
%       
% 	 G = [a b;b c];
% 	 [U,S,V]  = svd(G);
% 	 
% 	 %keyboard;
% 	 
% 	 % If non-invertible, then project the point onto the edge orthogonal:
% 	 
% 	 if (S(1,1)/S(2,2) > 50),
% 	    % projection operation:
% 	    xc2 = xc2 + sum((xc(i,:)-xc2).*(V(:,2)'))*V(:,2)';
% 	    type(i) = 1;
% 	 end;
%       
%       end;
%       
%       
%       v_extra = xc(i,:) - xc2;
%       
%       xc(i,:) = xc2;
%       
% %      keyboard;
% 
%       compt = compt + 1;
%       
%    end
% end;
% 
% 
% % check for points that diverge:
% 
% delta_x = xc(:,1) - xt(:,1);
% delta_y = xc(:,2) - xt(:,2);
% 
% %keyboard;
% 
% 
% bad = (abs(delta_x) > wintx) | (abs(delta_y) > winty);
% good = ~bad;
% in_bad = find(bad);
% 
% % For the diverged points, keep the original guesses:
% 
% xc(in_bad,:) = xt(in_bad,:);
% 
% xc = fliplr(xc);
% xc = xc';
% 
% bad = bad';
% good = good';
% 
% end
% 
% 
% function [H,Hnorm,inv_Hnorm] = compute_homography_intern(m,M)
% 
% %compute_homography
% %
% %[H,Hnorm,inv_Hnorm] = compute_homography(m,M)
% %
% %Computes the planar homography between the point coordinates on the plane (M) and the image
% %point coordinates (m).
% %
% %INPUT: m: homogeneous coordinates in the image plane (3xN matrix)
% %       M: homogeneous coordinates in the plane in 3D (3xN matrix)
% %
% %OUTPUT: H: Homography matrix (3x3 homogeneous matrix)
% %        Hnorm: Normalization matrix used on the points before homography computation
% %               (useful for numerical stability is points in pixel coordinates)
% %        inv_Hnorm: The inverse of Hnorm
% %
% %Definition: m ~ H*M where "~" means equal up to a non zero scalar factor.
% %
% %Method: First computes an initial guess for the homography through quasi-linear method.
% %        Then, if the total number of points is larger than 4, optimize the solution by minimizing
% %        the reprojection error (in the least squares sense).
% %
% %
% %Important functions called within that program:
% %
% %comp_distortion_oulu: Undistorts pixel coordinates.
% %
% %compute_homography.m: Computes the planar homography between points on the grid in 3D, and the image plane.
% %
% %project_points.m: Computes the 2D image projections of a set of 3D points, and also returns te Jacobian
% %                  matrix (derivative with respect to the intrinsic and extrinsic parameters).
% %                  This function is called within the minimization loop.
% 
% 
% 
% 
% Np = size(m,2);
% 
% if size(m,1)<3,
%    m = [m;ones(1,Np)];
% end;
% 
% if size(M,1)<3,
%    M = [M;ones(1,Np)];
% end;
% 
% 
% m = m ./ (ones(3,1)*m(3,:));
% M = M ./ (ones(3,1)*M(3,:));
% 
% % Prenormalization of point coordinates (very important):
% % (Affine normalization)
% 
% ax = m(1,:);
% ay = m(2,:);
% 
% mxx = mean(ax);
% myy = mean(ay);
% ax = ax - mxx;
% ay = ay - myy;
% 
% scxx = mean(abs(ax));
% scyy = mean(abs(ay));
% 
% 
% Hnorm = [1/scxx 0 -mxx/scxx;0 1/scyy -myy/scyy;0 0 1];
% inv_Hnorm = [scxx 0 mxx ; 0 scyy myy; 0 0 1];
% 
% mn = Hnorm*m;
% 
% % Compute the homography between m and mn:
% 
% % Build the matrix:
% 
% L = zeros(2*Np,9);
% 
% L(1:2:2*Np,1:3) = M';
% L(2:2:2*Np,4:6) = M';
% L(1:2:2*Np,7:9) = -((ones(3,1)*mn(1,:)).* M)';
% L(2:2:2*Np,7:9) = -((ones(3,1)*mn(2,:)).* M)';
% 
% if Np > 4,
% 	L = L'*L;
% end;
% 
% [U,S,V] = svd(L);
% 
% hh = V(:,9);
% hh = hh/hh(9);
% 
% Hrem = reshape(hh,3,3)';
% %Hrem = Hrem / Hrem(3,3);
% 
% 
% % Final homography:
% 
% H = inv_Hnorm*Hrem;
% 
% if 0,
%    m2 = H*M;
%    m2 = [m2(1,:)./m2(3,:) ; m2(2,:)./m2(3,:)];
%    merr = m(1:2,:) - m2;
% end;
% 
% %keyboard;
%  
% %%% Homography refinement if there are more than 4 points:
% 
% if Np > 4,
%    
%    % Final refinement:
%    hhv = reshape(H',9,1);
%    hhv = hhv(1:8);
%    
%    for iter=1:10,
%       
% 
%    
% 		mrep = H * M;
% 
% 		J = zeros(2*Np,8);
% 
% 		MMM = (M ./ (ones(3,1)*mrep(3,:)));
% 
% 		J(1:2:2*Np,1:3) = -MMM';
% 		J(2:2:2*Np,4:6) = -MMM';
% 		
% 		mrep = mrep ./ (ones(3,1)*mrep(3,:));
% 
% 		m_err = m(1:2,:) - mrep(1:2,:);
% 		m_err = m_err(:);
% 
% 		MMM2 = (ones(3,1)*mrep(1,:)) .* MMM;
% 		MMM3 = (ones(3,1)*mrep(2,:)) .* MMM;
% 
% 		J(1:2:2*Np,7:8) = MMM2(1:2,:)';
% 		J(2:2:2*Np,7:8) = MMM3(1:2,:)';
% 
% 		MMM = (M ./ (ones(3,1)*mrep(3,:)))';
% 
% 		hh_innov  = inv(J'*J)*J'*m_err;
% 
% 		hhv_up = hhv - hh_innov;
% 
% 		H_up = reshape([hhv_up;1],3,3)';
% 
% 		%norm(m_err)
% 		%norm(hh_innov)
% 
% 		hhv = hhv_up;
%       H = H_up;
%       
%    end;
%    
% 
% end;
% 
% if 0,
%    m2 = H*M;
%    m2 = [m2(1,:)./m2(3,:) ; m2(2,:)./m2(3,:)];
%    merr = m(1:2,:) - m2;
% end;
% 
% return;
% 
% %test of Jacobian
% 
% mrep = H*M;
% mrep = mrep ./ (ones(3,1)*mrep(3,:));
% 
% m_err = mrep(1:2,:) - m(1:2,:);
% figure(8);
% plot(m_err(1,:),m_err(2,:),'r+');
% std(m_err')
% 
% end % compute_homography_intern
% 
% 
% function [x] = comp_distortion_oulu_intern(xd,k)
% 
% %comp_distortion_oulu.m
% %
% %[x] = comp_distortion_oulu(xd,k)
% %
% %Compensates for radial and tangential distortion. Model From Oulu university.
% %For more informatino about the distortion model, check the forward projection mapping function:
% %project_points.m
% %
% %INPUT: xd: distorted (normalized) point coordinates in the image plane (2xN matrix)
% %       k: Distortion coefficients (radial and tangential) (4x1 vector)
% %
% %OUTPUT: x: undistorted (normalized) point coordinates in the image plane (2xN matrix)
% %
% %Method: Iterative method for compensation.
% %
% %NOTE: This compensation has to be done after the subtraction
% %      of the principal point, and division by the focal length.
% 
% 
% if length(k) == 1,
%     
%     [x] = comp_distortion(xd,k);
%     
% else
%     
%     k1 = k(1);
%     k2 = k(2);
%     k3 = k(5);
%     p1 = k(3);
%     p2 = k(4);
%     
%     x = xd; 				% initial guess
%     
%     for kk=1:20,
%         
%         r_2 = sum(x.^2);
%         k_radial =  1 + k1 * r_2 + k2 * r_2.^2 + k3 * r_2.^3;
%         delta_x = [2*p1*x(1,:).*x(2,:) + p2*(r_2 + 2*x(1,:).^2);
%         p1 * (r_2 + 2*x(2,:).^2)+2*p2*x(1,:).*x(2,:)];
%         x = (xd - delta_x)./(ones(2,1)*k_radial);
%             
%     end
%     
% end
% 
% end % compute_distortion_oulu_intern
