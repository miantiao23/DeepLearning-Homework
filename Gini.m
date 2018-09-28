function [ginirate] = Gini(Array,Target)

Num = numel(Array);
% error of Postive 
Array_Pos = Target(Array == 1);
Num_Array_Pos_Pos = numel(Array_Pos(Array_Pos == 1));
Num_Array_Pos_Neg = numel(Array_Pos(Array_Pos == 0)); 
Num_Array_Pos = numel(Array_Pos);

ginirate_Pos = 1 - (Num_Array_Pos_Pos/Num_Array_Pos).^2-(Num_Array_Pos_Neg/Num_Array_Pos).^2;

% error of Negative
Array_Neg = Target(Array == 0);
Num_Array_Neg_Pos = numel(Array_Neg(Array_Neg == 1));
Num_Array_Neg_Neg = numel(Array_Neg(Array_Neg == 0)); 
Num_Array_Neg = numel(Array_Neg);

ginirate_Neg = 1- (Num_Array_Neg_Pos/Num_Array_Neg).^2- (Num_Array_Neg_Neg/Num_Array_Neg).^2;

ginirate = Num_Array_Pos/Num * ginirate_Pos + Num_Array_Neg/Num * ginirate_Neg;

end