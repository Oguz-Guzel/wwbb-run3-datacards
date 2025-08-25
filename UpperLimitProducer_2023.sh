# use in singularity via
./start_el7.sh


# https://cms-hh.web.cern.ch/tools/inference/

export DATACARD_DIR=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/
export VERSION=singleTRG-2023
export BAMBOO_DIR=singleTRG-2023

cd BambooDatacardProducer/inference
source setup.sh

# combine all datacards for 2023
law run CombineDatacards --version $VERSION  --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/DL_boosted_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_boosted_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved1b_2023.txt',,$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved1b_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved2b_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved2b_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_boosted_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_boosted_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_resolved_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_resolved_2023BPix.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/DL_boosted_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_boosted_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved1b_2023.txt',,$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved1b_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved2b_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved2b_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_boosted_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_boosted_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_resolved_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_resolved_2023BPix.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'output/'$BAMBOO_DIR'/2023_all_combined_datacard.txt'

# combine 2023 pre-BPix datacards
law run CombineDatacards --version $VERSION  --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/DL_boosted_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved1b_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved2b_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_boosted_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_resolved_2023.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/DL_boosted_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved1b_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved2b_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_boosted_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_resolved_2023.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'output/'$BAMBOO_DIR'/combined_2023_datacard.txt'

# combine 2023 post-BPix datacards
law run CombineDatacards --version $VERSION  --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/DL_boosted_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved1b_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved2b_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_boosted_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_resolved_2023BPix.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/DL_boosted_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved1b_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved2b_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_boosted_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_VBF_resolved_2023BPix.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'output/'$BAMBOO_DIR'/combined_2023BPix_datacard.txt'

# run PlotUpperLimitsAtPoint task - combined only
law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/2023_all_combined_datacard.txt' --datacard-names "Combined" --workers 16

# run PlotUpperLimitsAtPoint task
law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/2023_all_combined_datacard.txt' --datacard-names "2023" --workers 16

# copy the upper limit plot
output_path=$(law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/2023_all_combined_datacard.txt' --datacard-names "Combined" --workers 16 --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

mkdir -p $DATACARD_DIR'results/'$BAMBOO_DIR'/'

cp "$output_path" $DATACARD_DIR'results/'$BAMBOO_DIR'/2023_upper_limits_at_point.pdf'

# run pulls and impacts
law run PlotPullsAndImpacts --version $VERSION --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/combined_2023_datacard.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/combined_2023BPix_datacard.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/2023_all_combined_datacard.txt' --campaign '2023' --PullsAndImpacts-workflow htcondor --order-by-impact

# copy the pulls and impacts plot
output_path=$(law run PlotPullsAndImpacts --version $VERSION --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/combined_2023_datacard.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/combined_2023BPix_datacard.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/2023_all_combined_datacard.txt' --campaign '2023' --PullsAndImpacts-workflow htcondor --order-by-impact --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'results/'$BAMBOO_DIR'/2023_pulls_and_impacts.pdf'

# run PlotUpperLimits task (kl scan)
law run PlotUpperLimits --version $VERSION --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/2023_all_combined_datacard.txt' --xsec fb --scan-parameters kl,-5,10,31 --y-log --workers 16 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1

output_path=$(law run PlotUpperLimits --version $VERSION --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/2023_all_combined_datacard.txt' --xsec fb --scan-parameters kl,-5,10,31 --y-log --workers 16 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1 --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'results/'$BAMBOO_DIR'/2023_kl_scan.pdf'









# run PlotLikelihoodScan task
law run PlotLikelihoodScan  --version $VERSION  --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/2023_all_combined_datacard.txt' --UpperLimits-custom-args='--X-rtd TMCSO_AdaptivePseudoAsimov=0 --X-rtd TMCSO_PseudoAsimov=0    --X-rt MINIMIZER_freezeDisassociatedParams   --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2  --X-rtd MINIMIZER_skipDiscreteIterations ' --pois kl --scan-parameters kl,-5,10,31 --workers 16  # --print-out 0



law run PlotPostfitSOverB --version $VERSION --datacards $DATACARD_DIR'output/'$BAMBOO_DIR'/DL_boosted_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_boosted_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved1b_2023.txt',,$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved1b_2023BPix.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved2b_2023.txt',$DATACARD_DIR'output/'$BAMBOO_DIR'/DL_resolved2b_2023BPix.txt'


