# use in singularity via
./start_el7.sh

export DATACARD_DIR=/afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/
cd BambooDatacardProducer/inference
source setup.sh

# combine all datacards for 2022
law run CombineDatacards --version v1.2.4-2022-mvaEval  --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_boosted_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_boosted_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved1b_2022.txt',,$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved1b_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved2b_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved2b_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_boosted_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_boosted_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_resolved_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_resolved_2022EE.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version v1.2.4-2022-mvaEval  --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_boosted_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_boosted_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved1b_2022.txt',,$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved1b_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved2b_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved2b_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_boosted_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_boosted_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_resolved_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_resolved_2022EE.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_datacard.txt'

# combine 2022 pre-EE datacards
law run CombineDatacards --version v1.2.4-2022-mvaEval  --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_boosted_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved1b_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved2b_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_boosted_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_resolved_2022.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version v1.2.4-2022-mvaEval  --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_boosted_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved1b_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved2b_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_boosted_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_resolved_2022.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_2022_datacard.txt'

# combine 2022 post-EE datacards
law run CombineDatacards --version v1.2.4-2022-mvaEval  --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_boosted_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved1b_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved2b_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_boosted_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_resolved_2022EE.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version v1.2.4-2022-mvaEval  --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_boosted_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved1b_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved2b_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_boosted_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_VBF_resolved_2022EE.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_2022EE_datacard.txt'

# run PlotUpperLimitsAtPoint task
law run PlotUpperLimitsAtPoint --version v1.2.4-2022-mvaEval  --multi-datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_2022_datacard.txt':$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_2022EE_datacard.txt':$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_datacard.txt' --datacard-names "2022","2022EE","Combined" --workers 16

# copy the upper limit plot
output_path=$(law run PlotUpperLimitsAtPoint --version v1.2.4-2022-mvaEval  --multi-datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_2022_datacard.txt':$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_2022EE_datacard.txt':$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_datacard.txt' --datacard-names "2022","2022EE","Combined" --workers 16 --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/2022_upper_limits_at_point.pdf'

# run pulls and impacts
law run PlotPullsAndImpacts --version v1.2.4-2022-mvaEval --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_2022_datacard.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_2022EE_datacard.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_datacard.txt' --campaign '2022'

# copy the pulls and impacts plot
output_path=$(law run PlotPullsAndImpacts --version v1.2.4-2022-mvaEval --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_2022_datacard.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_2022EE_datacard.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_datacard.txt' --campaign '2022' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/2022_pulls_and_impacts.pdf'

# run PlotUpperLimits task (kl scan)
law run PlotUpperLimits --version v1.2.4-2022-mvaEval --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_datacard.txt' --xsec fb --scan-parameters kl,-5,10,31 --y-log --workers 16 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1

output_path=$(law run PlotUpperLimits --version v1.2.4-2022-mvaEval --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_datacard.txt' --xsec fb --scan-parameters kl,-5,10,31 --y-log --workers 16 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1 --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/2022_kl_scan.pdf'









# run PlotLikelihoodScan task
law run PlotLikelihoodScan  --version v1.2.4-2022-mvaEval  --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/combined_datacard.txt' --UpperLimits-custom-args='--X-rtd TMCSO_AdaptivePseudoAsimov=0 --X-rtd TMCSO_PseudoAsimov=0    --X-rt MINIMIZER_freezeDisassociatedParams   --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2  --X-rtd MINIMIZER_skipDiscreteIterations ' --pois kl --scan-parameters kl,-5,10,31 --workers 16  # --print-out 0



law run PlotPostfitSOverB --version v1.2.4-2022-mvaEval --datacards $DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_boosted_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_boosted_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved1b_2022.txt',,$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved1b_2022EE.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved2b_2022.txt',$DATACARD_DIR'output/v1.2.4-2022-mvaEval-rebinning/DL_resolved2b_2022EE.txt'


