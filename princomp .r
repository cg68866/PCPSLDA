sample = read.csv('../data-PC.csv')

sample.pr = princomp(~x1+x2+x3+x4+x5+x6+x7+x8+x9+x10+x11+x12+x13+x14+x15+x16+x17+x18+x19+x20+x21+x22+x23+x24+x25+x26+x27+x28,data=sample,cor= T)

summary(sample.pr,loadings=T)

pre = predict(sample.pr)

sample$z1 = pre[,1];sample$z2 = pre[,2];sample$z3 = pre[,3];sample$z4 = pre[,4];sample$z5 = pre[,5];sample$z6 = pre[,6];sample$z7 = pre[,7];sample$z8 = pre[,8];sample$z9 = pre[,9];sample$z10 = pre[,10];sample$z11 = pre[,11];sample$z12 = pre[,12];sample$z13 = pre[,13];sample$z14 = pre[,14];sample$z15 = pre[,15];sample$z16 = pre[,16];sample$z17 = pre[,17];sample$z18 = pre[,18];sample$z19 = pre[,19];sample$z20 = pre[,20]

write.csv(sample,"data of pathological stage prediction.csv", row.names=F)