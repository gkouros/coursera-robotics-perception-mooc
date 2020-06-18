function [ H ] = est_homography(video_pts, logo_pts)
% est_homography estimates the homography to transform each of the
% video_pts into the logo_pts
% Inputs:
%     video_pts: a 4x2 matrix of corner points in the video
%     logo_pts: a 4x2 matrix of logo points that correspond to video_pts
% Outputs:
%     H: a 3x3 homography matrix such that logo_pts ~ H*video_pts
% Written for the University of Pennsylvania's Robotics:Perception course

% YOUR CODE HERE

% create lambda functions that generate vectors ax and ay for each point
ax = @(x, xp)[-x(1), - x(2), -1, 0, 0, 0, x(1)*xp(1), x(2)*xp(1), xp(1)];
ay = @(x, xp)[0, 0, 0, -x(1), -x(2), -1, x(1)*xp(2), x(2)*xp(2), xp(2)];

% get number of points (should be 4)
len = length(video_pts);
assert(len == 4);

% initialize matrix A with zeros to prevent resizing in loop
A = zeros(len, 9);

for i=1:len
    A(i * 2 - 1, :) = ax(video_pts(i, :), logo_pts(i, :));
    A(i * 2, :) = ay(video_pts(i, :), logo_pts(i, :));
end
    
[U, S, V] = svd(A);
H = reshape(V(:, end), [3,3])';

end

