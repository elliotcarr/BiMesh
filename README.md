## Hmesh: 2D image-based meshing of heterogeneous media

`Hmesh` is a simple MATLAB code for meshing two-dimensional heterogeneous media using Gmsh (http://geuz.org/gmsh/) and image-based techniques. The heterogeneous medium is assumed to be comprised of inclusions embedded in a connected sub-domain. The code reads in an image of the binary domain and identifies the coordinates of the inclusion boundaries, which are then used to define the geometry in Gmsh and ultimately mesh the domain.

## References

If you use `Hmesh`, we would appreciate that you mention it in your work by citing the following paper:

E. J. Carr and I. W. Turner (2014) [Two-scale computational modelling of water 
flow in unsaturated soils containing irregular-shaped inclusions](http://onlinelibrary.wiley.com/doi/10.1002/nme.4625/abstract).
International Journal for Numerical Methods in Engineering, Volume 98, Issue 3, Pages 157–173.

## Example

See `Example/Fractures.m`

Image of binary medium (.png file)<!---: connected sub-domain (light gray) and inclusion sub-domain (dark gray)--->

<img src="https://github.com/elliotcarr/BiMesh/raw/master/Example/Figures/Fractures.png" width="280px">

Unstructured meshes: <!--- The code accomodates three different options: the full domain, the connected sub-domain only and the inclusion sub-domain only --->

<img src="https://github.com/elliotcarr/BiMesh/raw/master/Example/Figures/MeshAB.png" width="350px">
<img src="https://github.com/elliotcarr/BiMesh/raw/master/Example/Figures/MeshA.png" width="350px">
<img src="https://github.com/elliotcarr/BiMesh/raw/master/Example/Figures/MeshB.png" width="350px">

## Installation

`Hmesh` can be downloaded from

https://github.com/elliotcarr/BiMesh/archive/master.zip

After unzipping, you will need to add the directory to the MATLAB path. You can do
this via the command:
```
addpath(pathname)
```
where `pathname` is the path to the unzipped directory.

## Contributors

If you would like to contribute to this code, please email me at [elliot.carr@qut.edu.au](mailto:elliot.carr@qut.edu.au).

## License

See `LICENSE.md` for licensing information.
