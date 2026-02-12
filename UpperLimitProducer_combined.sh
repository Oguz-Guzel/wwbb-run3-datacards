# use in singularity via
# ./start_el7.sh


# https://cms-hh.web.cern.ch/tools/inference/

cd BambooDatacardProducer/inference
source setup.sh

export BASE_DIR=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/
export DATACARDS_DIR=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/SR_v1.4.7_allSysts_rebinned
export VERSION=SR_v1.4.7_allSysts_rebinned_v1

# combine all datacards for 2022
law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/DL_boosted_2022.txt',$DATACARDS_DIR'/DL_boosted_2022EE.txt',$DATACARDS_DIR'/DL_resolved1b_2022.txt',$DATACARDS_DIR'/DL_resolved1b_2022EE.txt',$DATACARDS_DIR'/DL_resolved2b_2022.txt',$DATACARDS_DIR'/DL_resolved2b_2022EE.txt',$DATACARDS_DIR'/DL_VBF_boosted_2022.txt',$DATACARDS_DIR'/DL_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/DL_VBF_resolved_2022.txt',$DATACARDS_DIR'/DL_VBF_resolved_2022EE.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/DL_boosted_2022.txt',$DATACARDS_DIR'/DL_boosted_2022EE.txt',$DATACARDS_DIR'/DL_resolved1b_2022.txt',$DATACARDS_DIR'/DL_resolved1b_2022EE.txt',$DATACARDS_DIR'/DL_resolved2b_2022.txt',$DATACARDS_DIR'/DL_resolved2b_2022EE.txt',$DATACARDS_DIR'/DL_VBF_boosted_2022.txt',$DATACARDS_DIR'/DL_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/DL_VBF_resolved_2022.txt',$DATACARDS_DIR'/DL_VBF_resolved_2022EE.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/2022_all_combined_datacard.txt'


# combine all datacards for 2023
law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/DL_boosted_2023.txt',$DATACARDS_DIR'/DL_boosted_2023BPix.txt',$DATACARDS_DIR'/DL_resolved1b_2023.txt',$DATACARDS_DIR'/DL_resolved1b_2023BPix.txt',$DATACARDS_DIR'/DL_resolved2b_2023.txt',$DATACARDS_DIR'/DL_resolved2b_2023BPix.txt',$DATACARDS_DIR'/DL_VBF_boosted_2023.txt',$DATACARDS_DIR'/DL_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/DL_VBF_resolved_2023.txt',$DATACARDS_DIR'/DL_VBF_resolved_2023BPix.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/DL_boosted_2023.txt',$DATACARDS_DIR'/DL_boosted_2023BPix.txt',$DATACARDS_DIR'/DL_resolved1b_2023.txt',$DATACARDS_DIR'/DL_resolved1b_2023BPix.txt',$DATACARDS_DIR'/DL_resolved2b_2023.txt',$DATACARDS_DIR'/DL_resolved2b_2023BPix.txt',$DATACARDS_DIR'/DL_VBF_boosted_2023.txt',$DATACARDS_DIR'/DL_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/DL_VBF_resolved_2023.txt',$DATACARDS_DIR'/DL_VBF_resolved_2023BPix.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/2023_all_combined_datacard.txt'

# combine datacards from 2022 and 2023
law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/combined_datacard.txt'







# run PlotUpperLimitsAtPoint task 
law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt':$DATACARDS_DIR'/2023_all_combined_datacard.txt':$DATACARDS_DIR'/combined_datacard.txt' --datacard-names "2022,2023,Combined" --workers 16

# copy the upper limit plot
output_path=$(law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt':$DATACARDS_DIR'/2023_all_combined_datacard.txt':$DATACARDS_DIR'/combined_datacard.txt' --datacard-names "2022,2023,Combined" --workers 16 --workers 16 --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

mkdir -p $BASE_DIR'/results/'$VERSION'/'

cp "$output_path" $BASE_DIR'/results/'$VERSION'/2022_2023_combined_upper_limits_at_point.pdf'














# run pulls and impacts
law run PlotPullsAndImpacts --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --campaign '2022+2023' --PullsAndImpacts-workflow htcondor --order-by-impact --parameters-per-page 30 # --page 0

# copy the pulls and impacts plot
output_path=$(law run PlotPullsAndImpacts --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --campaign '2022+2023' --PullsAndImpacts-workflow htcondor --order-by-impact --print-out 0 --parameters-per-page 30 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_pulls_and_impacts.pdf'






# run PlotUpperLimits task (kl scan)
law run PlotUpperLimits --version $VERSION --datacards $DATACARDS_DIR'/combined_datacard.txt' --xsec fb --scan-parameters kl,-20,25,31 --y-log --workers 16 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1 --save-hep-data

output_path=$(law run PlotUpperLimits --version $VERSION --datacards $DATACARDS_DIR'/combined_datacard.txt' --xsec fb --scan-parameters kl,-20,25,31 --y-log --workers 16 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1 --save-hep-data --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_kl_scan.pdf'




# run PlotUpperLimits task (C2V scan)
law run PlotUpperLimits --version $VERSION --datacards $DATACARDS_DIR'/combined_datacard.txt' --xsec fb --scan-parameters C2V,-6,8,29 --y-log --workers 16 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1 --save-hep-data

output_path=$(law run PlotUpperLimits --version $VERSION --datacards $DATACARDS_DIR'/combined_datacard.txt' --xsec fb --scan-parameters C2V,-6,8,29 --y-log --workers 16 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1 --save-hep-data --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_C2V_scan.pdf'








# PlotLikelihoodScan - kl
law run PlotLikelihoodScan  --version $VERSION  --datacards $DATACARDS_DIR'/combined_datacard.txt' --UpperLimits-custom-args='--X-rtd TMCSO_AdaptivePseudoAsimov=0 --X-rtd TMCSO_PseudoAsimov=0    --X-rt MINIMIZER_freezeDisassociatedParams   --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2  --X-rtd MINIMIZER_skipDiscreteIterations ' --pois kl --scan-parameters kl,-20,25,31 --workers 16  # --print-out 0

output_path=$(law run PlotLikelihoodScan  --version $VERSION  --datacards $DATACARDS_DIR'/combined_datacard.txt' --UpperLimits-custom-args='--X-rtd TMCSO_AdaptivePseudoAsimov=0 --X-rtd TMCSO_PseudoAsimov=0    --X-rt MINIMIZER_freezeDisassociatedParams   --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2  --X-rtd MINIMIZER_skipDiscreteIterations ' --pois kl --scan-parameters kl,-20,25,31 --workers 16  --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_kl_likelihood_scan.pdf'





# Likelihoodscan - C2V
law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --pois C2V --scan-parameters C2V,-2,4 --LikelihoodScan-workflow htcondor 

output_path=$(law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --pois C2V --scan-parameters C2V,-2,4 --LikelihoodScan-workflow htcondor --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_k2V_likelihood_scan.pdf'





# run PlotPostfitSOverB task
law run PlotPostfitSOverB --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt'


output_path=$(law run PlotPostfitSOverB --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_postfit_SoverB.pdf'





# 2d scan of kl and k2V
law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --pois kl,C2V --scan-parameters kl,-20,26:C2V,-8,12 --LikelihoodScan-workflow htcondor --LikelihoodScan-tasks-per-job 1

output_path=$(law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --pois kl,C2V --scan-parameters kl,-20,26:C2V,-8,12 --LikelihoodScan-workflow htcondor --LikelihoodScan-tasks-per-job 1 --print-out 0| grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_kl_k2V_2D_scan.pdf'



# 2d scan of kl and kt
law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --pois kl,kt --scan-parameters kl,-40,30:kt,-10,10 --LikelihoodScan-workflow htcondor --LikelihoodScan-tasks-per-job 1

output_path=$(law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --pois kl,kt --scan-parameters kl,-40,30:kt,-10,10 --LikelihoodScan-workflow htcondor --LikelihoodScan-tasks-per-job 1 --print-out 0| grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_kl_kt_2D_scan.pdf'




law run PlotGoodnessOfFit \
    --version $VERSION \
    --datacards $DATACARDS_DIR'/combined_datacard.txt' \
    --toys 1000 \
    --toys-per-branch 20 \
    --frequentist-toys
    --GoodnessOfFit-workflow htcondor

output_path=$(law run PlotGoodnessOfFit \
    --version $VERSION \
    --datacards $DATACARDS_DIR'/combined_datacard.txt' \
    --toys 1000 \
    --toys-per-branch 20 \
    --frequentist-toys
    --GoodnessOfFit-workflow htcondor \
    --print-out 0 | grep -o 'file://.*' | sed 's|file://||')    

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_goodness_of_fit.pdf'