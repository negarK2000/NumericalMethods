function [ df ] = dfx_SRK( z )
global A1 B1
df=z.^2.*3-z.*2+(A1-B1-B1^2);
end