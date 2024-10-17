echo "Running law commands for bbww"

https://cms-hh.web.cern.ch/tools/inference/

echo "//////////////////////////////"
echo "Running: CombineDatacards
law run CombineDatacards --version v1.0.7-2023full  --datacards /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7-2023full/DL_DNN_score_2023.txt,/afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7-2023full/DL_DNN_score_2023BPix.txt # --print-out 0

echo "//////////////////////////////"
echo "Running: PlotUpperLimitsAtPoint
law run PlotUpperLimitsAtPoint --version v1.0.7-2023full  --multi-datacards /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7-2023full/DL_DNN_score_2023.txt:/afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7-2023full/DL_DNN_score_2023BPix.txt:/afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7-2023full/combined_datacard.txt --datacard-names "2023","2023BPix","Combined" # --print-out 0

echo "//////////////////////////////"
echo "Running: PlotUpperLimits
law run PlotUpperLimits --version v1.0.7-2023full --datacards /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7-2023full/combined_datacard.txt --xsec fb --pois kl --scan-parameters kl,-20,20,20:kl,-5,10,31 --y-log --workers 2 # --print-out 0

echo "//////////////////////////////"
echo "Running: PlotLikelihoodScan
law run PlotLikelihoodScan  --version v1.0.7-2023full  --datacards /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7-2023full/combined_datacard.txt --UpperLimits-custom-args='--X-rtd TMCSO_AdaptivePseudoAsimov=0 --X-rtd TMCSO_PseudoAsimov=0    --X-rt MINIMIZER_freezeDisassociatedParams   --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2  --X-rtd MINIMIZER_skipDiscreteIterations ' --pois kl --scan-parameters kl,-20,20,20:kl,-5,10,31 --workers 2

echo "//////////////////////////////"
echo "Running: PlotPullsAndImpacts"
law run PlotPullsAndImpacts --version v1.0.7-2023full --datacards /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7-2023full/combined_datacard.txt  --workers 24 --mc-stats --order-by-impact # --print-out 0