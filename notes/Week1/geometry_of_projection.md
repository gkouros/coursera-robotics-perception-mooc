# Week 1: Geometry of Projection

## Camera modelling

- Different kinds of sensors: ladybug (array for panoramic views), kinect, laser scanner, stereo camera

### Camera:
- 2 basic elements: (1) cmos imaging chip, (2) lens

#### Lenses
Lenses have a unique property to concentrate rays 
![thin_lens.png](images/thin_lens.png)

<img src="https://render.githubusercontent.com/render/math?math={\frac{1}{f} = \frac{1}{a} %2B \frac{1}{b}}">

a: the distance between the object and the lense  
b: the distance between the lense and the image plane  
f: f or focal length is the distance between the lense and the focal point  

- focusing:
  - Controlling the image plane is the process of rotating a ring on the lense to adjust the focal length.
  - Modern cameras do this automatically (autofocusing)
  - Blur is caused when the above equation is not validated (out of focus)

The following equation expresses the relationship between the height of the object Y in 
and the height of the object y in the image plane (size of orange lines)
<img src="https://render.githubusercontent.com/render/math?math={\frac{Y}{a}=\frac{y}{b}}">

If the distance of the object to the lense becomes larger (increase in Y) then y becomes smaller.


## Perspective Projection
Perspective projection is the mapping of 3D points in a 2D plane eg. the image plane.  

- Parallel lines in the world converge into a vanishing point
- All vanishing points in the image belong define the horizon or vanishing line
- Parallel lines perpendicular to the image plane stay parallel
- Vertical vanishing points are perpendicular to the horizon

- Perspective projection formulations can be expressed through homogenous coordinates
  - Homogenous coordinates can express points at infinity, homographies, perspective projection, and multi view relationships
  - The Projective Plane is the 2D image plane 
  - A point (x,y) in the image plane is a ray (sx, sy, s) in projective space 
    - all points in the ray are equivalent (x,y,1)=(sx,sy,s)
  - Homogeneous coordinates represent coordinates in 2 dimensions with a 3-vector (x, y) -> (x, y, 1)

## Rotations and Translations

- Camera coordinate system represented by 3 axis X, Y, Z. Corresponds with image plane coordinate system
  - X: red to the right
  - Y: green down
  - Z: blue forwards

## Pinhole Camera Model
- matrix K: intrinsics of the camera - transforms optical information to pixels
- matrix L: focal lens parameters
- matrix [R t]: extrinsics of the camera - pose of the camera wrt to world coordinates
- [X 1]^T = L ( K [R t] [X 1]^T): transform 3D points in world coordinates to 2D coordinates in image plane

3D image to 2d:
- x' = f * X / Z
- y' = f * Y / Z
- Z: focal distance - distance between optical center and object
- f: focal length - distance between optical center and canvas
- bigger focal length -> smaller field of view
- smaller focal length -> bigger field of view
- How do you calibrate the focal length? With a calibration board eg. checkerboard
- Zooming: process of changing the focal lense
- large focal length compresses depth
