function [error] = errorRate(Array,Target)

Num = numel(Array);
% error of Postive 
Array_Pos = Target(Array == 1);
Num_Array_Pos_Pos = numel(Array_Pos(Array_Pos == 1));
Num_Array_Pos_Neg = numel(Array_Pos(Array_Pos == 0)); 
Num_Array_Pos = numel(Array_Pos);

Error_Pos = 1 - max(Num_Array_Pos_Pos/Num_Array_Pos, Num_Array_Pos_Neg/Num_Array_Pos);

% error of Negative
Array_Neg = Target(Array == 0);
Num_Array_Neg_Pos = numel(Array_Neg(Array_Neg == 1));
Num_Array_Neg_Neg = numel(Array_Neg(Array_Neg == 0)); 
Num_Array_Neg = numel(Array_Neg);

Error_Neg = 1- max(Num_Array_Neg_Pos/Num_Array_Neg, Num_Array_Neg_Neg/Num_Array_Neg);

error = Num_Array_Pos/Num * Error_Pos + Num_Array_Neg/Num * Error_Neg;

end