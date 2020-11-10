library(roundup)
library(exp)
library(rotate)
library(rotate_angle)
library(inn)
library(comp)
library(CRRC)
library(coordinate axis_link)
library(set)
library(union)
library(G_stability)
library(activity)
library(difference_set)
library(null) 
O=read.table("data_PC.csv",header=T)
n=roundup(pi/g)
seed=comp(Quar[1],rotate_angle(xoy,0))
for (i in 1:n)
 {
     g_1=g*i
     CRRC(rotate(xoy,coordinate axis_link(s[i],o,t[i])),Q,g_1)
     set(cluster[i],union(seed,G_stability(Q,rotate(xoy,coordinate axis_link(s          [i],o,t[i])),activity(Q,rotate(xoy,coordinate axis_link(s[i],o,t[i])))))
  }
for(i in 1:number(cluster))
 {
     if(null(difference_set(cluster[i],seed)))
           {
                for(j in1:n)  
                {
                   set(cluster,union(cluster,cluster[j]))  
                 }
           }
 }
write(cluster,file="cluster.csv")
write(seed,file="seed.csv")