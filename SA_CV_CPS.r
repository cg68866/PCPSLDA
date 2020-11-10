library(N)
library(IRM)
library(set)
library(OVA)
library(map)
library(HIR)
library(rank_set)
library(top)
library(IN)
library(difference_set)
library(R_overlap)
seed=read.table("seed.csv",header=T)
cluster=read.table("cluster.csv",header=T)
number_seed=N(seed)
n=N(cluster)
Q_core=null
for(i in 1:number_seed)
 {
     for(j in 1:n)
      {
        set(IRM(seed,cluster),map(Q[i],cluster[j])*OVA(map(Q[i],cluster[j])))
      }
 }
for(i in 1:number_seed)
 {
      rank_final(Q[i])=HIR(rank_n(Q[i],n),SD/AMV)
 }
while(N(Q*_core)<number_seed*cut_core)
 {
      set(Q*_core,IN(top(rank_final(Q[i])),seed))
      set(seed,difference_set(seed,top(rank_final(Q[i]))))
 }
set(Q_core,R_overlap(Q*_core))
write(Q_core,file="Q_core.csv")