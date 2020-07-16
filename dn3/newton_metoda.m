function [x0, k] = newton_metoda(F, JF, x0, maxSteps, tol)
    k = 0;
    dx = 1;

    while (k < maxSteps) && (norm(dx) >= tol * norm(x0))
        dx = JF(x0) \ -F(x0);
        k = k + 1;
        x0 = x0 + dx; 
    end

end
% X = x0; %vektor 1x5
% dx = Inf; %sprememba x
% k = 0; %stevilo korakov
% while  norm(dx) > tol && k < N
%     k = k+1;
%     dx = -Jf(X(:,k))\f(X(:,k));
%     X(:,k+1) = X(:,k) + dx;
% end
% x = X(:,k+1);
% end