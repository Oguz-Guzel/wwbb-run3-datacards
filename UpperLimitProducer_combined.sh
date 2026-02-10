# use in singularity via
# ./start_el7.sh


# https://cms-hh.web.cern.ch/tools/inference/

export DATACARD_DIR=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/
export DATACARD_DIR_2022=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/v1.4.6-2022-mva
export DATACARD_DIR_2023=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/v1.4.6-2023-mva
export BAMBOO_DIR=v1.4.6
export VERSION=v1.4.6

cd BambooDatacardProducer/inference
source setup.sh

# combine datacards from 2022 and 2023
law run CombineDatacards --version $VERSION  --datacards $DATACARD_DIR_2022'/2022_all_combined_datacard.txt',$DATACARD_DIR_2023'/2023_all_combined_datacard.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARD_DIR_2022'/2022_all_combined_datacard.txt',$DATACARD_DIR_2023'/2023_all_combined_datacard.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

mkdir -p $DATACARD_DIR'/output/'$VERSION

cp "$output_path" $DATACARD_DIR'/output/'$VERSION'/combined_datacard.txt'

cp $DATACARD_DIR_2022/*root $DATACARD_DIR'/output/'$VERSION
cp $DATACARD_DIR_2022/*txt $DATACARD_DIR'/output/'$VERSION
cp $DATACARD_DIR_2023/*txt $DATACARD_DIR'/output/'$VERSION
cp $DATACARD_DIR_2023/*root $DATACARD_DIR'/output/'$VERSION

# run PlotUpperLimitsAtPoint task 
law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARD_DIR_2022'/2022_all_combined_datacard.txt':$DATACARD_DIR_2023'/2023_all_combined_datacard.txt':$DATACARD_DIR'/output/'$VERSION'/combined_datacard.txt' --datacard-names "2022,2023,Combined" --workers 16

# copy the upper limit plot
output_path=$(law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARD_DIR_2022'/2022_all_combined_datacard.txt':$DATACARD_DIR_2023'/2023_all_combined_datacard.txt':$DATACARD_DIR'/output/'$VERSION'/combined_datacard.txt' --datacard-names "2022,2023,Combined" --workers 16 --workers 16 --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

mkdir -p $DATACARD_DIR'/results/'$VERSION'/'

cp "$output_path" $DATACARD_DIR'/results/'$VERSION'/2022_2023_combined_upper_limits_at_point.pdf'














# run pulls and impacts
law run PlotPullsAndImpacts --version $VERSION --datacards $DATACARD_DIR_2022'/2022_all_combined_datacard.txt',$DATACARD_DIR_2023'/2023_all_combined_datacard.txt',$DATACARD_DIR'/output/'$VERSION'/combined_datacard.txt' --campaign '2022+2023' --PullsAndImpacts-workflow htcondor --order-by-impact --parameters-per-page 25 --page 0

# copy the pulls and impacts plot
output_path=$(law run PlotPullsAndImpacts --version $VERSION --datacards $DATACARD_DIR_2022'/2022_all_combined_datacard.txt',$DATACARD_DIR_2023'/2023_all_combined_datacard.txt',$DATACARD_DIR'/output/'$VERSION'/combined_datacard.txt' --campaign '2022+2023' --PullsAndImpacts-workflow htcondor --order-by-impact --print-out 0 --parameters-per-page 25 --page 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'results/'$BAMBOO_DIR'/2022_2023_pulls_and_impacts.pdf'






# run PlotUpperLimits task (kl scan)
law run PlotUpperLimits --version $VERSION --datacards $DATACARD_DIR'/output/'$VERSION'/combined_datacard.txt' --xsec fb --scan-parameters kl,-20,25,31 --y-log --workers 16 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1 --save-hep-data

output_path=$(law run PlotUpperLimits --version $VERSION --datacards $DATACARD_DIR'/output/'$VERSION'/combined_datacard.txt' --xsec fb --scan-parameters kl,-20,25,31 --y-log --workers 16 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1 --save-hep-data --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'results/'$BAMBOO_DIR'/2022_2023_kl_scan.pdf'










# run PlotLikelihoodScan task
law run PlotLikelihoodScan  --version $VERSION  --datacards $DATACARD_DIR'/output/'$VERSION'/combined_datacard.txt' --UpperLimits-custom-args='--X-rtd TMCSO_AdaptivePseudoAsimov=0 --X-rtd TMCSO_PseudoAsimov=0    --X-rt MINIMIZER_freezeDisassociatedParams   --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2  --X-rtd MINIMIZER_skipDiscreteIterations ' --pois kl --scan-parameters kl,-20,25,31 --workers 16  # --print-out 0

output_path=$(law run PlotLikelihoodScan  --version $VERSION  --datacards $DATACARD_DIR'/output/'$VERSION'/combined_datacard.txt' --UpperLimits-custom-args='--X-rtd TMCSO_AdaptivePseudoAsimov=0 --X-rtd TMCSO_PseudoAsimov=0    --X-rt MINIMIZER_freezeDisassociatedParams   --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2  --X-rtd MINIMIZER_skipDiscreteIterations ' --pois kl --scan-parameters kl,-20,25,31 --workers 16  --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'results/'$BAMBOO_DIR'/2022_2023_likelihood_scan.pdf'













# run PlotPostfitSOverB task
law run PlotPostfitSOverB --version $VERSION --datacards $DATACARD_DIR_2022'/2022_all_combined_datacard.txt',$DATACARD_DIR_2023'/2023_all_combined_datacard.txt',$DATACARD_DIR'/output/'$VERSION'/combined_datacard.txt'


output_path=$(law run PlotPostfitSOverB --version $VERSION --datacards $DATACARD_DIR_2022'/2022_all_combined_datacard.txt',$DATACARD_DIR_2023'/2023_all_combined_datacard.txt',$DATACARD_DIR'/output/'$VERSION'/combined_datacard.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'results/'$BAMBOO_DIR'/2022_2023_postfit_SoverB.pdf'
