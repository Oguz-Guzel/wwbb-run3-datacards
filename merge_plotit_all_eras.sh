cd /afs/cern.ch/work/a/aguzel/private/BambooDatacardProducer

python merge_plotit_all_eras.py

mkdir /afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/v1.4.7/plotit/plots_Run3

plotIt -i /afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/v1.4.7/plotit -o /afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/v1.4.7/plotit/plots_Run3 /afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/v1.4.7/plotit/plots_Run3.yml