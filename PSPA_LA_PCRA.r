source（'VIRA_RF.r'）
source（'princomp.r'）
library(N)
library(significance)
library(set)
library(sort)
library(map)
library(projection)
library(cor)
library(summary)
library(C_uP_r)
library(logistic_regession)
M_LC=read.table("M_LC.csv",header=T)
for(i in 1:N(M_LC))
 {
   set(significance(lr[i]),VIRA_RF(M_LC))
 }
set(Q,sort(map(lr,M_LC),significance(lr[i]),desc))
set((seed,cluster),ClGeA(Q,g))
set(Q_core,SA_CV_CPS(seed,cluster,SD/AMV,cut_core))
set(M_LC_core,projection(M_LC,Q_core))
cor(M_LC_core)
set(pca,princomp(M_LC_core,cor=T))
summary(pca)
for(k in 1:N(pca))
 {
   if(C_uP_r(comp[k])<=c_r)
       
           set(pca_final,comp[k])
      
   else
           break;
 }
set(P_rM_o,logistic_regession(pca_final))
write(P_rM_o,file="P_rM_o.csv")