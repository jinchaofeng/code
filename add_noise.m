function vmeas2 = add_noise(vmeas,m)
n = randn(length(vmeas),1);
% n = n./max(max(abs(n))); % make sure we go from -1 : 1
vmeas2 = vmeas + m.*(vmeas./100).*n;

% error = [];
% for i=1:9
%     error = [error, norm(xk(:,i+1)-xk(:,i))/norm(xk(:,i+1))];
% end