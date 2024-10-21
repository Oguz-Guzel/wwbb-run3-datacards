cd BambooDatacardProducer/inference
source setup.sh
source ~/.bash_profile
103
cd BambooDatacardProducer
source datacard_env/bin/activate
python produceDataCards.py --yaml /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/config/bbWW_run3_datacard.yml

https://cms-hh.web.cern.ch/tools/inference/

law run CombineDatacards --version v1.0.7_2023-dnnEval-v2.2.1  --datacards /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7_2023-dnnEval-v2.2.1/DL_DNN_score_2023.txt,/afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7_2023-dnnEval-v2.2.1/DL_DNN_score_2023BPix.txt --workers 24 # --print-out 0

copy the datacard caombined_datacard.txt

law run PlotUpperLimitsAtPoint --version v1.0.7_2023-dnnEval-v2.2.1  --multi-datacards /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7_2023-dnnEval-v2.2.1/DL_DNN_score_2023.txt:/afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7_2023-dnnEval-v2.2.1/DL_DNN_score_2023BPix.txt:/afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7_2023-dnnEval-v2.2.1/combined_datacard.txt --datacard-names "2023","2023BPix","Combined" --workers 24 # --print-out 0

law run PlotUpperLimits --version v1.0.7_2023-dnnEval-v2.2.1 --datacards /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7_2023-dnnEval-v2.2.1/combined_datacard.txt --xsec fb --scan-parameters kl,-20,20,20:kl,-5,10,31 --y-log --workers 24 # --print-out 0

law run PlotLikelihoodScan  --version v1.0.7_2023-dnnEval-v2.2.1  --datacards /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/output/v1.0.7_2023-dnnEval-v2.2.1/combined_datacard.txt --UpperLimits-custom-args='--X-rtd TMCSO_AdaptivePseudoAsimov=0 --X-rtd TMCSO_PseudoAsimov=0    --X-rt MINIMIZER_freezeDisassociatedParams   --X-rtd MINIMIZER_multiMin_hideConstants --X-rtd MINIMIZER_multiMin_maskConstraints --X-rtd MINIMIZER_multiMin_maskChannels=2  --X-rtd MINIMIZER_skipDiscreteIterations ' --pois kl --scan-parameters kl,-20,20,20:kl,-5,10,31 --workers 24