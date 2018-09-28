function [Delta] = InformationEntropy(V,Num)

Delta = - (V/Num)*log2(V/Num);

if isnan(Delta) == 1
    Delta = 0;
end

end


