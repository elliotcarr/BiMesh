function mesh_geo(image,fname,r,a,b,option)
% -------------------------------------------------------------------------
% image_based_meshing.m
%
% This MATLAB file generates gmsh .geo using an image of the micro-cell.
%
% -------------------------------------------------------------------------

% Convert to a binary image
I = imread(image); BW = im2bw(I,graythresh(I));

% Identify the coordinates of the boundary pixels of the inclusions
B = bwboundaries(BW); [m,n] = size(BW); 
p = length(B)-1; 
x = cell(p,1); 
y = x;
for k = 1:p, 
    x{k} = a*(B{k+1}(:,2))/m; 
    y{k} = b*(n-B{k+1}(:,1))/n; 
end

%--------------------------------------------------------------------------
% Generate gmsh .geo file
fid = fopen([fname,'.geo'], 'w');
fprintf(fid,'Point(1) = {0,0,0,%g};\n',r);
fprintf(fid,'Point(2) = {%g,0,0,%g};\n',a,r);
fprintf(fid,'Point(3) = {%g,%g,0,%g};\n',a,b,r);
fprintf(fid,'Point(4) = {0,%g,0,%g};\n',b,r);
fprintf(fid,'Line(1)  = {1,2};\n');
fprintf(fid,'Line(2)  = {2,3};\n');
fprintf(fid,'Line(3)  = {3,4};\n');
fprintf(fid,'Line(4)  = {4,1};\n');

pts = 4;
for k = 1:p
    spt = pts+1;
    for i = 1:length(x{k})
        pts=pts+1; 
        fprintf(fid,'Point(%i) = {%g,%g,0,%g};\n',pts,x{k}(i),y{k}(i),r);
    end
    ept = pts; 
    fprintf(fid,'BSpline(%i) = {',k+4);
    for i = ept:-1:spt
        fprintf(fid,'%i, ',i); 
    end
    fprintf(fid,'%i};\n',ept);
end
fprintf(fid,'Line Loop(1) = {1,2,3,4};\n');

% Sub-domain B (inclusions)
for k = 1:p
    fprintf(fid,'Line Loop(%i) = {%i};\n',k+1,k+4); 
end
for k = 1:p
    fprintf(fid,'Plane Surface(%i) = {%i};\n',k+1,k+1);
end

% Sub-domain A (connnected)
if strcmp(option,'AB') || strcmp(option,'A') 
    fprintf(fid,'Plane Surface(1) = {1'); 
    for k = 1:p
        fprintf(fid,', %i', k+1); 
    end
    fprintf(fid,'};\n');
end

% Interface edges between two sub-domains
fprintf(fid,'Physical Line(99) = {5'); 
for k = 2:p
    fprintf(fid,', %i', k+4);
end
fprintf(fid,'};\n');

% Build periodic array of cells
fprintf(fid,'Physical Surface(1) = {1};\n');
if strcmp(option,'AB') || strcmp(option,'B')
    fprintf(fid,'Physical Surface(2) = {2');
    for k = 2:p, 
        fprintf(fid,', %i', k+1); 
    end
    fprintf(fid,'};\n');
end
fclose(fid);
