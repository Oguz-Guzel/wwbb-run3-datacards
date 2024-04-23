echo "Running law commands for bbww"

# first combine the datacards
law run CombineDatacards --version bbww-run3-test14 --datacards /home/ucl/cp3/aguzel/bamboo_105/BambooDatacardProducer/output/v0.9.64/DL_DNN_score_2022.txt,/home/ucl/cp3/aguzel/bamboo_105/BambooDatacardProducer/output/v0.9.64/DL_DNN_score_2022EE.txt

echo "//////////////////////////////"
echo "Running: PlotUpperLimitsAtPoint"
law run PlotUpperLimitsAtPoint --version bbww-run3-test14 --multi-datacards /home/ucl/cp3/aguzel/bamboo_105/BambooDatacardProducer/output/v0.9.64/DL_DNN_score_2022.txt:/home/ucl/cp3/aguzel/bamboo_105/BambooDatacardProducer/output/v0.9.64/DL_DNN_score_2022EE.txt:/home/ucl/cp3/aguzel/bamboo_105/BambooDatacardProducer/inference/data/store/CombineDatacards/hh_model__model_default/datacards_a9bf3574c3/m125.0/bbww-run3-test14/datacard.txt   --workers 48    --datacard-names 2022preEE,2022postEE,Combined # --print-out 0

echo "//////////////////////////////"
echo "Running: PlotLikelihoodScan"
law run PlotLikelihoodScan --version bbww-run3-test14 --datacards /home/ucl/cp3/aguzel/bamboo_105/BambooDatacardProducer/output/v0.9.64/DL_DNN_score_2022.txt,/home/ucl/cp3/aguzel/bamboo_105/BambooDatacardProducer/output/v0.9.64/DL_DNN_score_2022EE.txt  --y-log --workers 48  --pois kl,kt --scan-parameters kl,-30,30:kt,-10,10 # --print-out 0

echo "//////////////////////////////"
echo "Running: PlotPullsAndImpacts"
bash-4.2$ law run PlotPullsAndImpacts --version bbww-run3-test14 --datacards /home/ucl/cp3/aguzel/bamboo_105/BambooDatacardProducer/output/v0.9.64/DL_DNN_score_2022.txt,/home/ucl/cp3/aguzel/bamboo_105/BambooDatacardProducer/output/v0.9.64/DL_DNN_score_2022EE.txt  --workers 48 --mc-stats --order-by-impact # --print-out 0