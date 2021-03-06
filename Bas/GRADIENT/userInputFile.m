%This file contains the definition of the unit cell. To create an 
%architected material, 4 steps have to be taken.
%
%----------
%STEP 1) Each unit cell consists op P polyhedra, which can be initialized 
%by calling:
%
%unitCell.Polyhedron(i)=polyhedra('namePolyhedron')
%
%in which i=1,2,...P and P is at least equal to one. Examples of 
%'namePolyhedron' are: 'cube', 'triangular prism', 'truncated octahedron'.
%See the "polyhedra.m" file for all the implemented polyhedra.
%
%----------
%STEP 2) When the unit cell containts more than one polyhedra, P-1 relations have
%to be specified to orient and connect the polyhedra. This can be done by
%specifying for each additional polyhedra (i=2,3,...,P) the following
%matrix
%
%unitCell.expCon(i-1).dir=[v1a v1b p1;
%                          v2a v2b p2;
%                          v3a v3b p3]
%
%Here, each line represents one congruent vertex pair, in which v1a refers 
%to the 1st vertex label of the i-th polyhedron, and v1b refers to the 1st 
%vertex label of the p1-th polyhedron etc. Depending on the initial 
%orientation of the polyhedra, the number of rows can be less than three.
%Note that when P=1, unitCell.expCon does not have to be specified.
%
%----------
%STEP 3) Three independent periodically located face pairs externally 
%located on the unit cell have to be specified. These face pairs are used
%to determine the lattice vectors of the unit cell:
%
%unitCell.perCon=[f1a f1b p1a p1b;
%                 f2a f2b p2a p2b;
%                 f3a f3b p2a p2b]
%
%Here, f1a and f2a are the labels of the face pairs periodically located, 
%which respectively belong to polyhedra with index p1a and p1b etc.
%
%----------
%STEP 4) An additional step can be taken to reduce the connectivity in the
%architected material. For each i-th polyhedron, faces can be made rigid, 
%instead of extruded, by specifying:
%
%unitCell.Polyhedron(i).solidify=[f1,f2,etc.]
%
%Here, f1 and f2 refer to the face labels of the i-th polyhedron. Note that
%this step can be skipped and "solidify" does not have to be specified.

unitCell.Polyhedron(1)=polyhedra('rhombicuboctahedron');
unitCell.Polyhedron(2)=polyhedra('cuboctahedron');
unitCell.Polyhedron(3)=polyhedra('cube');
unitCell.Polyhedron(4)=polyhedra('cube');
unitCell.Polyhedron(5)=polyhedra('cube');
unitCell.expCon(1).dir=[2 14 1; 4 22 1; 1 10 1];
unitCell.expCon(2).dir=[7 12 1; 3 24 1; 1 22 1];
unitCell.expCon(3).dir=[7 22 1; 5 14 1; 3 21 1];
unitCell.expCon(4).dir=[7 2 1; 3 6 1; 4 14 1];
unitCell.perCon=[4 3 1 1;6 5 1 1;1 2 1 1];
unitCell.Polyhedron(1).solidify=[1,2,3,4,5,6,8,9,11,13,16,18,19,20,21,22,24,26];
unitCell.Polyhedron(2).solidify=[7,9,11,12,13,14];
unitCell.Polyhedron(3).solidify=[3,4];
unitCell.Polyhedron(4).solidify=[2,5];
unitCell.Polyhedron(5).solidify=[2,5];