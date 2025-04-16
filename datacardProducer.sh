#!/bin/sh

./start_el7.sh

export DATACARD_DIR=/afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer/wwbb-run3-datacards/

cd BambooDatacardProducer/inference
source setup.sh
source ~/.bash_profile
103
cd BambooDatacardProducer
source datacard_env/bin/activate
python produceDataCards.py --yaml $DATACARD_DIR'config/config_2022.yml'

# https://cms-hh.web.cern.ch/tools/inference/