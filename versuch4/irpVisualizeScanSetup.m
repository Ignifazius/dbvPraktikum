%
% irpVisualizeScanSetup is used to get an impression of the 3d setting of
% the calibration setup.
% The positions of the calibration planes are displayed as well as the 2
% outmost projector planes.
%
% usage:
%   irpVisualizeScanSetup(CTW1,CTW2,calib_dist,PlaneNormals,PlaneDs)
%  or with 3d points:
%   irpVisualizeScanSetup(CTW1,CTW2,calib_dist,PlaneNormals,PlaneDs,Points3D)
%
% needed values:
%   - CTW1: transformation matrix (extrinsic parameters) of the first calibration plane
%   - CTW2: transformation matrix (extrinsic parameters) of second calibration plane
%   - calib_dist = [x_dist, y_dist]: distances of calibration points on planes
%   - PlaneNormals: normals of projector planes
%   - PlaneDs: distances of projector planes from origin
% optional: 
%   - Points3D: 3d points of a scanned object (obtained by irpGetObject3D).
%               This is only a very rough representation of the scanned
%               object.

function irpVisualizeScanSetup(CTW1,CTW2,calib_dist,PlaneNormals,PlaneDs,Points3D)

dx = calib_dist(1);
dy = calib_dist(2);

% projector planes
proj_y = 75; % assumed y position of projector

% find outmost plane indices
[first last] = irpGetOuterPlanesIndices(PlaneNormals);

A_n = [PlaneNormals(first,1), PlaneNormals(first,3);
       PlaneNormals(last,1), PlaneNormals(last,3)];
b_n = [PlaneDs(first)-PlaneNormals(first,2)*proj_y;
       PlaneDs(last)-PlaneNormals(last,2)*proj_y];
proj_xz = A_n\b_n;
proj_pos = [proj_xz(1),proj_y,proj_xz(2)];
%proj_pos = [-300,proj_y,200];

% points on calibration plane 1
P1 = CTW1*[0,0,0,1]';
P2 = CTW1*[dx,0,0,1]';
P3 = CTW1*[dx,dy,0,1]';
P4 = CTW1*[0,dy,0,1]';

figure,
hold on
xlim([proj_pos(1)-200 proj_pos(1)+1000]);xlim('manual');
ylim([-200 200]);ylim('manual');
%zlim([proj_pos(3) proj_pos(3)+3000]);zlim('manual');
zlim([0 3000]);zlim('manual');
axis off
daspect([1 1 1]);
campos('manual');
campos([0,-2000,-6000]);
camtarget('manual');
camtarget(P1(1:3));
colormap jet
camproj('perspective');

%find point on outer planes closest to corners of calibration plane
%first projector plane
Pm = (P1(1:3)+P4(1:3))/2;
n_square = PlaneNormals(first,:)*PlaneNormals(first,:)';
t_p = PlaneDs(first)-PlaneNormals(first,:)*Pm/n_square;
x_m = Pm'+t_p*PlaneNormals(first,:);
x_p1 = x_m + [0 -200 0];
x_p2 = x_m + [0 200 0];
x_data = [proj_pos(1),x_p1(1),x_p2(1)];
y_data = [proj_pos(2),x_p1(2),x_p2(2)];
z_data = [proj_pos(3),x_p1(3),x_p2(3)];
pat = patch(x_data,y_data,z_data,'g');
set(pat,'FaceAlpha',0.4);
% last projector plane
Pm = (P2(1:3)+P3(1:3))/2;
n_square = PlaneNormals(last,:)*PlaneNormals(last,:)';
t_p = PlaneDs(last)-PlaneNormals(last,:)*Pm/n_square;
x_m = Pm'+t_p*PlaneNormals(last,:);
x_p1 = x_m + [0 -200 0];
x_p2 = x_m + [0 200 0];
x_data = [proj_pos(1),x_p1(1),x_p2(1)];
y_data = [proj_pos(2),x_p1(2),x_p2(2)];
z_data = [proj_pos(3),x_p1(3),x_p2(3)];
pat = patch(x_data,y_data,z_data,'g');
set(pat,'FaceAlpha',0.4);

% ground plane
gp_y = P1(2)+55;
%patch([proj_pos(1)-200 proj_pos(1)-200 proj_pos(1)+1000 proj_pos(1)+1000],[gp_y gp_y gp_y gp_y],[proj_pos(3)-100 proj_pos(3)+3000 proj_pos(3)+3000 proj_pos(3)-100],'y');
patch([proj_pos(1)-300 proj_pos(1)-300 proj_pos(1)+1000 proj_pos(1)+1000],[gp_y gp_y gp_y gp_y],[-50 3000 3000 -50],'y');

x_data = [P1(1),P2(1),P3(1),P4(1)];
y_data = [P1(2),P2(2),P3(2),P4(2)];
z_data = [P1(3),P2(3),P3(3),P4(3)];

pat = patch(x_data,y_data,z_data,'c');
set(pat,'FaceAlpha',0.6);

P1 = CTW2*[0,0,0,1]';
P2 = CTW2*[dx,0,0,1]';
P3 = CTW2*[dx,dy,0,1]';
P4 = CTW2*[0,dy,0,1]';

x_data = [P1(1),P2(1),P3(1),P4(1)];
y_data = [P1(2),P2(2),P3(2),P4(2)];
z_data = [P1(3),P2(3),P3(3),P4(3)];

pat = patch(x_data,y_data,z_data,'c');
set(pat,'FaceAlpha',0.6);

plot3([0,0],[0,0],[0,300],'-b','LineWidth',1);
plot3([0,100],[0,0],[0,0],'-r','LineWidth',1);
plot3([0,0],[0,100],[0,0],'-b','LineWidth',1);

%camera
cam_size = 30;
patch([0 cam_size cam_size],[0 -cam_size cam_size],[0 2*cam_size 2*cam_size],'m');
patch([0 cam_size -cam_size],[0 cam_size cam_size],[0 2*cam_size 2*cam_size],'m');
patch([0 -cam_size -cam_size],[0 cam_size -cam_size],[0 2*cam_size 2*cam_size],'m');
patch([0 -cam_size cam_size],[0 -cam_size -cam_size],[0 2*cam_size 2*cam_size],'m');

if nargin > 5
    allpoints = zeros(size(find(Points3D(:,:,3)>0),1),3);
    allpos = 1;
    for y=1:size(Points3D,1)
        for x=1:size(Points3D,2)
%            if mod(x+y,2) == 0
                point3d = [Points3D(y,x,1),Points3D(y,x,2),Points3D(y,x,3)];
                if point3d(3) > 0
                    allpoints(allpos,1:3) = point3d;
                    allpos = allpos+1;
                end
%            end
        end
    end
%    plot3(allpoints(:,1),allpoints(:,2),allpoints(:,3),' .b');
    plot3(allpoints(1:10:end,1),allpoints(1:10:end,2),allpoints(1:10:end,3),' .b');
end

%clear dx dy P1 P2 P3 P4 Pm t_p x_data y_data z_data n_square
%clear first last entries gp_y cam_size point3d allpoints
%clear proj_pos
