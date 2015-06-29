function mesh = read_gmsh(fname)

% Read gmsh .msh file
fid = fopen([fname,'.msh'], 'r');
while 1
    tline = fgetl(fid);
    if ~ischar(tline)
        break
    end
    switch tline
        case '$MeshFormat'
            tline = fgetl(fid);
            if ~ischar(tline), break, end
            tline = fgetl(fid);
            if ~ischar(tline) || ~strcmp(tline,'$EndMeshFormat')
                break
            end
        case '$Nodes'
            tline = fgetl(fid);
            no_nodes = sscanf(tline,'%g');            
            nodes = zeros(no_nodes,2);            
            for i = 1:no_nodes
                tline = fgetl(fid);
                type = sscanf(tline,'%g %g %g %g');
                nodes(i,1:2) = type(2:3);
            end            
            tline = fgetl(fid);
            if ~ischar(tline) || ~strcmp(tline,'$EndNodes')
                break
            end            
        case '$Elements'
            tline = fgetl(fid);
            if ~ischar(tline)
                break
            end
            no_elements = 0;
            no_objects  = sscanf(tline,'%g'); elements = [];
            ifnodes = []; no_ifedges = 0; subdomain = [];
            for i = 1:no_objects
                tline = fgetl(fid);
                type=sscanf(tline,'%g %g %g %g %g %g %g %g')';
                if type(2)==2
                    no_elements = no_elements+1;
                    elements(no_elements,1:3) = type(6:8);
                    subdomain(no_elements) = type(4);
                end
                if type(4) == 99
                    no_ifedges = no_ifedges + 1;
                    ifnodes = union(ifnodes, type(6:7));
                    ifedges(no_ifedges,1:3) = [type(6:7),-1];
                end
            end
            tline = fgetl(fid);
            if ~ischar(tline) || ~strcmp(tline,'$EndElements')
                break
            end
        otherwise
            disp('Unknown type encountered...')
            break
    end
    
end
fclose(fid);

mesh.no_nodes    = no_nodes;
mesh.no_elements = no_elements;
mesh.no_ifedges  = no_ifedges;
mesh.nodes       = nodes;
mesh.elements    = elements;
mesh.subdomain   = subdomain;
mesh.ifedges     = ifedges;
mesh.ifnodes     = ifnodes;