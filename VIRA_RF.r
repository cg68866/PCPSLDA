library(readxl)
library(rpart)
sdf=read_excel("M-LC.csv")
sdf
vilist=NULL
for(r in 1:T)#(480,T=10000;240,T=6000;120,T=2000)
{
    selrows=sample(1:nrow(sdf),nrow(sdf),replace=T)
    selcols=c("Species",sample(setdiff(colnames(sdf),"Species"),15))
    trainset=sdf[selrows,selcols]
    oobset=sdf[setdiff(1:nrow(sdf),selrows),selcols]
    t0=rpart(Species~.,data=trainset)
    oobset$pred=predict(t0,oobset,type="class")
    oob=1-sum(diag(table(oobset$Species,oobset$pred)))/nrow(oobset)
    oobset$pred=NULL
    var=setdiff(selcols,"Species")
    decreaseAccuracy=NULL
    for(ivar in var)
    {
        oobset_sl=oobset
        eval(parse(text=paste("oobset_sl$",ivar,"=sample(oobset_sl$",ivar,
                              ",nrow(oobset_sl))",sep="")))
        oobset_sl$pred=predict(t0,oobset_sl,type="class")
        oob_sl=1-sum(diag(table(oobset_sl$Species,
                                oobset_sl$pred)))/nrow(oobset_sl)
         decreaseAccuracy=c(decreaseAccuracy,(oob_sl-oob))
    }

    names(decreaseAccuracy)=var
    vilist=c(vilist,decreaseAccuracy)
}

d0=data.frame(var=names(vilist),val=vilist,stringsAsFactors=F)
out_avg=aggregate.data.frame(d0$val,by=list(d0$var),mean)
out_sd=aggregate.data.frame(d0$val,by=list(d0$var),sd)
MeanDecreaseAccuracy.scale=out_avg[,2]/out_sd[,2]
names(MeanDecreaseAccuracy.scale)=out_sd[,1]
write.table(MeanDecreaseAccuracy.scale,file="significance(lr_i).txt",col.names=T,quote=T)

