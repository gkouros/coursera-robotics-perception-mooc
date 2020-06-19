function E = EssentialMatrixFromFundamentalMatrix(F,K)
%% EssentialMatrixFromFundamentalMatrix
% Use the camera calibration matrix to esimate the Essential matrix
% Inputs:
%     K - size (3 x 3) camera calibration (intrinsics) matrix
%     F - size (3 x 3) fundamental matrix from EstimateFundamentalMatrix
% Outputs:
%     E - size (3 x 3) Essential matrix with singular values (1,1,0)

% calculate essential matrix
E = K' * F * K;

% decompose E using svd
[U, S, V] = svd(E);

% recompose E with S=diag([1 1 0])
%E = U * S * V';
E = U * diag([1 1 0]) * V';

% normalize E
E = E / norm(E);

end
