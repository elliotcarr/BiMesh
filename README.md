# BiMesh

`BiMesh` is a simple MATLAB code for meshing binary mediums. The code reads in a bitmap image of the medium, converts
## References

If you use `BiMesh`, we would appreciate that you mention it in your work by citing the following paper:

E. J. Carr and I. W. Turner (2014) [Two-scale computational modelling of water 
flow in unsaturated soils containing irregular-shaped inclusions](http://onlinelibrary.wiley.com/doi/10.1002/nme.4625/abstract).
International Journal for Numerical Methods in Engineering, Volume 98, Issue 3, Pages 157–173.

## Example

<figure><img src="https://github.com/elliotcarr/BiMesh/raw/master/Examples/Fractures.png" width="200px" height="200px"></figure>

Meshing the full domain:



<img src="https://github.com/elliotcarr/BiMesh/raw/master/Examples/Figures/MeshAB.png" width="400px">
<img src="https://github.com/elliotcarr/BiMesh/raw/master/Examples/Figures/MeshA.png" width="400px">
<img src="https://github.com/elliotcarr/BiMesh/raw/master/Examples/Figures/MeshB.png" width="400px">

## Installation

`BiMesh` can be downloaded from

https://github.com/elliotcarr/BiMesh/archive/master.zip

After unzipping, you will need to add the directory to the MATLAB path. You can do
this via the command:
```
addpath(pathname)
```
where `pathname` is the path to the unzipped directory.

## License

See `LICENSE.md` for licensing information.
