#!/bin/sh

export DATACARD_DIR=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/

cd BambooDatacardProducer/inference
source setup.sh
105
cd /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer
source /afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/datacard_env/bin/activate

python produceDataCards.py --yaml $DATACARD_DIR'config/config_combined_sr.yml'

python produceDataCards.py --yaml $DATACARD_DIR'config/config_combined_dy.yml'

python produceDataCards.py --yaml $DATACARD_DIR'config/config_combined_tt.yml'





cd /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer

python merge_plotit_all_eras.py  /afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/SR_v1.4.7_noRebinning_v1/plotit SR

mkdir /afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/SR_v1.4.7_noRebinning_v1/plotit/plots_Run3

plotIt -i /afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/SR_v1.4.7_noRebinning_v1/plotit -o /afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/SR_v1.4.7_noRebinning_v1/plotit/plots_Run3 /afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/SR_v1.4.7_noRebinning_v1/plotit/plots_Run3.yml




# plotIt -i output/SR_2022_combined/ -o output/SR_2022_combined/plots output/SR_2022_combined/plots.yml