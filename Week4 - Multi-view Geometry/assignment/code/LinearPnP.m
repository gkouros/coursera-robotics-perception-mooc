function [C, R] = LinearPnP(X, x, K)
%% LinearPnP
% Getting pose from 2D-3D correspondences
% Inputs:
%     X - size (N x 3) matrix of 3D points
%     x - size (N x 2) matrix of 2D points whose rows correspond with X
%     K - size (3 x 3) camera calibration (intrinsics) matrix
% Outputs:
%     C - size (3 x 1) pose transation
%     R - size (3 x 1) pose rotation
%
% IMPORTANT NOTE: While theoretically you can use the x directly when solving
% for the P = [R t] matrix then use the K matrix to correct the error, this is
% more numeically unstable, and thus it is better to calibrate the x values
% before the computation of P then extract R and t directly

% MYCODE
if 1
    N = size(X, 1);
    
    % calibrate x
    xc = K \ [x, ones(N, 1)]';
    xc = xc';
    
    X = [X ones(N, 1)];
  
    V0 = zeros(N, 1);
    V1 = ones(N, 1);
    
    A = [V0, V0, V0, V0, -X, xc(:,2).*X;
         X, V0, V0, V0, V0, -xc(:,1).*X;
         -xc(:,2).*X, xc(:,1).*X V0, V0, V0, V0];
         
    [~, ~, V] = svd(A);

    P = reshape(V(:,end), [4, 3])';
    
    RT = P; %K \ P;
    
    R = RT(:, 1:3);
    T = RT(:, end);
    
    [U, S, V] = svd(R);
    
    det_uv = det(U*V');
    if abs(det_uv - 1) < 0.0001
       R = U * V';
       T = T / S(1, 1);
    elseif abs(det_uv + 1) < 0.0001
       R = -U * V';
       T = -T / S(1, 1);
    end
       
    C = -R' * T;
end

end