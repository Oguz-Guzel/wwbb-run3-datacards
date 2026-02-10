#!/bin/sh

# ./start_el7.sh

export DATACARD_DIR=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/

cd BambooDatacardProducer/inference
source setup.sh
# source ~/.bash_profile
105
cd /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer
source /afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/datacard_env/bin/activate

python produceDataCards.py --yaml $DATACARD_DIR'config/config_2022.yml'

python produceDataCards.py --yaml $DATACARD_DIR'config/config_2023.yml'

python produceDataCards.py --yaml $DATACARD_DIR'config/config_combined.yml'