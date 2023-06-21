function [ f ] = fx_SRK( z )
global A1 B1
f=z.^3-z.^2+z.*(A1-B1-B1^2)-A1*B1;
end