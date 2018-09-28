function [Entropy_B,Delta_A] = InformationGain(A,B)

Num_Class_Pos = numel(B(B==1));
Num_Class_Neg = numel(B(B==0));
% Num_Class = numel(Target_Class);
Num = numel(B);

% Entropy
Entropy_B = InformationEntropy(Num_Class_Pos,Num) ...
         + InformationEntropy(Num_Class_Neg,Num);

 
Delta_Pos_A = B(A==1);
Delta_Pos_A_Pos =  numel(Delta_Pos_A(Delta_Pos_A==1));
Delta_Pos_A_Neg =  numel(Delta_Pos_A(Delta_Pos_A==0));
Delta_Pos_A_Num =  numel(Delta_Pos_A);

Delta_Neg_A = B(A==0);
Delta_Neg_A_Pos =  numel(Delta_Neg_A(Delta_Neg_A==1));
Delta_Neg_A_Neg =  numel(Delta_Neg_A(Delta_Neg_A==0));
Delta_Neg_A_Num =  numel(Delta_Neg_A);

Delta_Pos_A = InformationEntropy(Delta_Pos_A_Pos,Delta_Pos_A_Num)...
              + InformationEntropy(Delta_Pos_A_Neg,Delta_Pos_A_Num);
          
Delta_Neg_A = InformationEntropy(Delta_Neg_A_Pos,Delta_Neg_A_Num)...
              + InformationEntropy(Delta_Neg_A_Neg,Delta_Neg_A_Num);
          
Delta_A = Entropy_B - Delta_Pos_A_Num/Num * Delta_Pos_A...
          - Delta_Neg_A_Num/Num * Delta_Neg_A;

end