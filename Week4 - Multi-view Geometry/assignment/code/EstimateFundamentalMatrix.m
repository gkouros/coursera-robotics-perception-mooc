function F = EstimateFundamentalMatrix(x1, x2)
%% EstimateFundamentalMatrix
% Estimate the fundamental matrix from two image point correspondences 
% Inputs:
%     x1 - size (N x 2) matrix of points in image 1
%     x2 - size (N x 2) matrix of points in image 2, each row corresponding
%       to x1
% Output:
%    F - size (3 x 3) fundamental matrix with rank 2
N = size(x1, 1);

A = zeros(N, 9);
A(:, 1) = x1(:, 1) .* x2(:, 1);
A(:, 2) = x1(:, 2) .* x2(:, 1);
A(:, 3) = x2(:, 1);
A(:, 4) = x1(:, 1) .* x2(:, 2);
A(:, 5) = x1(:, 2) .* x2(:, 2);
A(:, 6) = x2(:, 2);
A(:, 7) = x1(:, 1);
A(:, 8) = x1(:, 2);
A(:, 9) = 1;

% solve least squares Ax = 0 with svd
[~, ~, V] = svd(A);

% F is the last column of V reshaped to a 3x3 matrix
F = V(:,end);
F = reshape(F, [3 3]);

% Enforce rank 2
[U, S, V] = svd(F);
S(3,3) = 0;
F = U * S* V';

% normalize F
F = F / norm(F);

end