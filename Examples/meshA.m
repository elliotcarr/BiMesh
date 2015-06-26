commandwindow
clc
close all
clear all

% To use mesh_cell.m
addpath('..') 

image  = 'ImageA.png';  % Micro-cell
r      = 0.1;           % Mesh refinement parameter
width  = 1;             % Width of micro-cell
height = 1;             % Height of micro-cell
domain = 'AB';          % Domain 
fname  = 'MeshAB.geo';  % File name of gmsh .geo file
ncells = 1;
mcells = 1;
mesh_cell(image,fname,r,width,height,domain,ncells,mcells);

domain = 'A';           % Domain 
fname  = 'MeshA.geo';   % File name of gmsh .geo file
mesh_cell(image,fname,r,width,height,domain,ncells,mcells);

domain = 'B';           % Domain 
fname  = 'MeshB.geo';   % File name of gmsh .geo file
mesh_cell(image,fname,r,width,height,domain,ncells,mcells);