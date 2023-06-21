function [ f ] = fx_peng_robinson( z )
global A2 B2
f=z.^3-z.^2.*(1-B2)+ (A2-2*B2-3*B2^2).*z-(A2*B2-B2^2-B2^3);
end