function [ f ] = fx_SRK( z )
global A B
f=z.^3-z.^2+z.*(A-B-B^2)-A*B;
end