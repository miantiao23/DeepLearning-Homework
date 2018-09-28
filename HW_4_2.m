Instance = 1:9;
A1 = [1 1 1 0 0 0 0 1 0];
A2 = [1 1 0 0 1 1 0 0 1];
A3 = [1 6 5 4 7 3 8 7 5];
Target_Class = [1 1 0 1 0 0 0 1 0];
Num_Class_Pos = numel(Target_Class(Target_Class==1));
Num_Class_Neg = numel(Target_Class(Target_Class==0));
Num_Class = numel(Target_Class);


% Entropy
Entropy = InformationEntropy(Num_Class_Pos,Num_Class) ...
         + InformationEntropy(Num_Class_Neg,Num_Class);


Num = numel(A1);

% Delta of A1

Delta_Pos_A1 = Target_Class(A1==1);
Delta_Pos_A1_Pos =  numel(Delta_Pos_A1(Delta_Pos_A1==1));
Delta_Pos_A1_Neg =  numel(Delta_Pos_A1(Delta_Pos_A1==0));
Delta_Pos_A1_Num =  numel(Delta_Pos_A1);

Delta_Neg_A1 = Target_Class(A1==0);
Delta_Neg_A1_Pos =  numel(Delta_Neg_A1(Delta_Neg_A1==1));
Delta_Neg_A1_Neg =  numel(Delta_Neg_A1(Delta_Neg_A1==0));
Delta_Neg_A1_Num =  numel(Delta_Neg_A1);

Delta_Pos_A1 = InformationEntropy(Delta_Pos_A1_Pos,Delta_Pos_A1_Num)...
              + InformationEntropy(Delta_Pos_A1_Neg,Delta_Pos_A1_Num);
          
Delta_Neg_A1 = InformationEntropy(Delta_Neg_A1_Pos,Delta_Neg_A1_Num)...
              + InformationEntropy(Delta_Neg_A1_Neg,Delta_Neg_A1_Num);
          
Delta_A1 = Entropy -  Delta_Pos_A1_Num/Num * Delta_Pos_A1...
          - Delta_Neg_A1_Num/Num * Delta_Neg_A1;
 
% Delta of A2 

Delta_Pos_A2 = Target_Class(A2==1);
Delta_Pos_A2_Pos =  numel(Delta_Pos_A2(Delta_Pos_A2==1));
Delta_Pos_A2_Neg =  numel(Delta_Pos_A2(Delta_Pos_A2==0));
Delta_Pos_A2_Num =  numel(Delta_Pos_A2);

Delta_Neg_A2 = Target_Class(A2==0);
Delta_Neg_A2_Pos =  numel(Delta_Neg_A2(Delta_Neg_A2==1));
Delta_Neg_A2_Neg =  numel(Delta_Neg_A2(Delta_Neg_A2==0));
Delta_Neg_A2_Num =  numel(Delta_Neg_A2);

Delta_Pos_A2 = InformationEntropy(Delta_Pos_A2_Pos,Delta_Pos_A2_Num)...
              + InformationEntropy(Delta_Pos_A2_Neg,Delta_Pos_A2_Num);
          
Delta_Neg_A2 = InformationEntropy(Delta_Neg_A2_Pos,Delta_Neg_A2_Num)...
              + InformationEntropy(Delta_Neg_A2_Neg,Delta_Neg_A2_Num);
          
Delta_A2 = Entropy -  Delta_Pos_A2_Num/Num * Delta_Pos_A2...
          - Delta_Neg_A2_Num/Num * Delta_Neg_A2;

      
    Delta_A3 = zeros(1,8);  
    
for Times = [1 3 4 5 6 7 8]
    
    Delta_Pos_A3 = Target_Class(A3 > Times);
    Delta_Pos_A3_Pos =  numel(Delta_Pos_A3(Delta_Pos_A3==1));
    Delta_Pos_A3_Neg =  numel(Delta_Pos_A3(Delta_Pos_A3==0));
    Delta_Pos_A3_Num =  numel(Delta_Pos_A3);

    Delta_Neg_A3 = Target_Class(A3 <= Times);
    Delta_Neg_A3_Pos =  numel(Delta_Neg_A3(Delta_Neg_A3==1));
    Delta_Neg_A3_Neg =  numel(Delta_Neg_A3(Delta_Neg_A3==0));
    Delta_Neg_A3_Num =  numel(Delta_Neg_A3);

    Delta_Pos_A3_V = InformationEntropy(Delta_Pos_A3_Pos,Delta_Pos_A3_Num)...
              + InformationEntropy(Delta_Pos_A3_Neg,Delta_Pos_A3_Num);
          
    Delta_Neg_A3_V = InformationEntropy(Delta_Neg_A3_Pos,Delta_Neg_A3_Num)...
              + InformationEntropy(Delta_Neg_A3_Neg,Delta_Neg_A3_Num);
          
    Delta_A3(Times) = Entropy -  Delta_Pos_A3_Num/Num * Delta_Pos_A3_V...
          - Delta_Neg_A3_Num/Num * Delta_Neg_A3_V;
    
end
      
Error_A1 = errorRate(A1, Target_Class);
Error_A2 = errorRate(A2, Target_Class);

Gini_A1 = Gini(A1, Target_Class);
Gini_A2 = Gini(A2, Target_Class);

