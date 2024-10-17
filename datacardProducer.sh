cd BambooDatacardProducer/inference
source setup.sh
source ~/.bash_profile
103
cd BambooDatacardProducer
source datacard_env/bin/activate
python produceDataCards.py --yaml wwbb-run3-datacards/config/bbWW_run3_datacard.yml