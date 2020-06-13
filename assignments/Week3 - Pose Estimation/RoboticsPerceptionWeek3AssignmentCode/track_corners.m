function [ corners ] = track_corners(images, img_pts_init)
%TRACK_CORNERS 
% This function tracks the corners in the image sequence and visualizes a
% virtual box projected into the image
% Inputs:
%     images - size (N x 1) cell containing the sequence of images to track
%     img_pts_init - size (4 x 2) matrix containing points to initialize
%       the tracker
% Outputs:
%     corners - size (4 x 2 x N) array of where the corners are tracked to

corners = zeros(4,2,size(images,1));

%%%% INITIALIZATION CODE FOR TRACKER HERE %%%%
tracker = vision.PointTracker('MaxBidirectionalError',1);
initialize(tracker, img_pts_init, cell2mat(images(1)));

img_pts = img_pts_init; % img_pts is where you will store the tracked points
corners(:,:,1) = img_pts;

% Iterate through the rest of the images
for i = 2:size(images,1)
    %%%% CODE FOR TRACKING HERE %%%%
    [img_pts, ~] = tracker(cell2mat(images(i)));
    
    % Store corners and visualize results (if desired)
    corners(:,:,i) = img_pts;
end

end