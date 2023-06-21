function [ df ] = dfx_SRK( z )
global A B
df=z.^2.*3-z.*2+(A-B-B^2);
end