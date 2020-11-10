# PCPSLDA
Principal component regression analysis for lncRNA-disease association prediction based on pathological stage data

# Requirements
The parameters are set in Weka as follows.
batchSize=100

debug=false

doNotCheckCapabilities=false

maxlts=-1
numDecimalPlaces=4
ridge=1.0E-8
useConjugateGradientDescent=false
seed=Q[1,120]
θ=π/6
SD/AMV=2/3
cut^core=0.25
c^r=0.9

# Usage
In this GitHub repository, we show how PCPSLDA works . The code is executed by Weka. The specific implementation is that Weka invokes R procedure using the RPlugin package. In data folder, we give the entire data set we used in our study.
1. You can get pathological stage.csv from clinical.tsv.
2. You can get data_PC.csv by associating lncRNA.csv with pathological stage.csv.
3. data_PC.csv is the input of ClGeA.r. The output of ClGeA.r is data(from cluster-1.xlsx to cluster-6.xlsx) in clusters folder. cluster-1-pilot process.xlsx is the pilot process of cluster-1.xlsx. The other five are the same.
4. clusters_OVA.xlsx is got by OVA in clusters, and is the input of SA_CV_CPS.r. 
5. core variable.xlsx is the output of SA_CV_CPS.r.  
6. core variable_corresponding.xlsx corresponds to the gene gene name of core variable.xlsx.
7. princomp .r and VIRA_RF.r are subfunctions of PSPA_LA_PCRA.r. The running of PSPA_LA_PCRA.r needs call princomp .r and VIRA_RF.r in Weka.
8. data of pathological stage prediction.arff is data format in Weka for PSPA_LA_PCRA.r. 
9. PCA_final.csv is data in step 11 of PSPA_LA_PCRA.r, and is the input of  step 15 of PSPA_LA_PCRA.r.
In addition, we provide a leave-one-out cross validation to evaluate our model. You can use evaluation.kf to see experimental results.
The other details can see the paper and the codes.
  
# License
This project is licensed under the MIT License - see the LICENSE.txt file for details.
