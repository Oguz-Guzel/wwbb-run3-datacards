# use in singularity via
# ./start_el7.sh


# https://cms-hh.web.cern.ch/tools/inference/

cd BambooDatacardProducer/inference
source setup.sh

export BASE_DIR=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/

export DATACARDS_DIR=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/SR_v1.4.7_threshold2_correlated_v4
export VERSION=SR_v1.4.7_threshold2_correlated_v4_CRs_added_run_2

export DATACARDS_DIR=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/SR_v1.4.7_half_bins_correlated_v4
export VERSION=SR_v1.4.7_half_bins_correlated_v4_CRs_added_run_1

export DATACARDS_DIR=/afs/cern.ch/work/a/aguzel/private/wwbb-run3-datacards/output/SR_v1.4.7_quantile_correlated_v1
export VERSION=SR_v1.4.7_quantile_correlated_v1_CRs_added_run_1

# combine all datacards for 2022
law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_boosted_2022.txt',$DATACARDS_DIR'/SR_GGF_boosted_2022EE.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2022EE.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2022EE.txt',$DATACARDS_DIR'/SR_VBF_boosted_2022.txt',$DATACARDS_DIR'/SR_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/SR_VBF_resolved_2022.txt',$DATACARDS_DIR'/SR_VBF_resolved_2022EE.txt',$DATACARDS_DIR'/DY_boosted_2022.txt',$DATACARDS_DIR'/DY_boosted_2022EE.txt',$DATACARDS_DIR'/DY_resolved1b_2022.txt',$DATACARDS_DIR'/DY_resolved1b_2022EE.txt',$DATACARDS_DIR'/DY_resolved2b_2022.txt',$DATACARDS_DIR'/DY_resolved2b_2022EE.txt',$DATACARDS_DIR'/DY_VBF_boosted_2022.txt',$DATACARDS_DIR'/DY_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/DY_VBF_resolved_2022.txt',$DATACARDS_DIR'/DY_VBF_resolved_2022EE.txt',$DATACARDS_DIR'/TT_boosted_2022.txt',$DATACARDS_DIR'/TT_boosted_2022EE.txt',$DATACARDS_DIR'/TT_resolved1b_2022.txt',$DATACARDS_DIR'/TT_resolved1b_2022EE.txt',$DATACARDS_DIR'/TT_resolved2b_2022.txt',$DATACARDS_DIR'/TT_resolved2b_2022EE.txt',$DATACARDS_DIR'/TT_VBF_boosted_2022.txt',$DATACARDS_DIR'/TT_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/TT_VBF_resolved_2022.txt',$DATACARDS_DIR'/TT_VBF_resolved_2022EE.txt'


# copy the combined datacard
output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_boosted_2022.txt',$DATACARDS_DIR'/SR_GGF_boosted_2022EE.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2022EE.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2022EE.txt',$DATACARDS_DIR'/SR_VBF_boosted_2022.txt',$DATACARDS_DIR'/SR_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/SR_VBF_resolved_2022.txt',$DATACARDS_DIR'/SR_VBF_resolved_2022EE.txt',$DATACARDS_DIR'/DY_boosted_2022.txt',$DATACARDS_DIR'/DY_boosted_2022EE.txt',$DATACARDS_DIR'/DY_resolved1b_2022.txt',$DATACARDS_DIR'/DY_resolved1b_2022EE.txt',$DATACARDS_DIR'/DY_resolved2b_2022.txt',$DATACARDS_DIR'/DY_resolved2b_2022EE.txt',$DATACARDS_DIR'/DY_VBF_boosted_2022.txt',$DATACARDS_DIR'/DY_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/DY_VBF_resolved_2022.txt',$DATACARDS_DIR'/DY_VBF_resolved_2022EE.txt',$DATACARDS_DIR'/TT_boosted_2022.txt',$DATACARDS_DIR'/TT_boosted_2022EE.txt',$DATACARDS_DIR'/TT_resolved1b_2022.txt',$DATACARDS_DIR'/TT_resolved1b_2022EE.txt',$DATACARDS_DIR'/TT_resolved2b_2022.txt',$DATACARDS_DIR'/TT_resolved2b_2022EE.txt',$DATACARDS_DIR'/TT_VBF_boosted_2022.txt',$DATACARDS_DIR'/TT_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/TT_VBF_resolved_2022.txt',$DATACARDS_DIR'/TT_VBF_resolved_2022EE.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/2022_all_combined_datacard.txt'


# combine all datacards for 2023
law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_boosted_2023.txt',$DATACARDS_DIR'/SR_GGF_boosted_2023BPix.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2023.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2023BPix.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2023.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2023BPix.txt',$DATACARDS_DIR'/SR_VBF_boosted_2023.txt',$DATACARDS_DIR'/SR_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/SR_VBF_resolved_2023.txt',$DATACARDS_DIR'/SR_VBF_resolved_2023BPix.txt',$DATACARDS_DIR'/DY_boosted_2023.txt',$DATACARDS_DIR'/DY_boosted_2023BPix.txt',$DATACARDS_DIR'/DY_resolved1b_2023.txt',$DATACARDS_DIR'/DY_resolved1b_2023BPix.txt',$DATACARDS_DIR'/DY_resolved2b_2023.txt',$DATACARDS_DIR'/DY_resolved2b_2023BPix.txt',$DATACARDS_DIR'/DY_VBF_boosted_2023.txt',$DATACARDS_DIR'/DY_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/DY_VBF_resolved_2023.txt',$DATACARDS_DIR'/DY_VBF_resolved_2023BPix.txt',$DATACARDS_DIR'/TT_boosted_2023.txt',$DATACARDS_DIR'/TT_boosted_2023BPix.txt',$DATACARDS_DIR'/TT_resolved1b_2023.txt',$DATACARDS_DIR'/TT_resolved1b_2023BPix.txt',$DATACARDS_DIR'/TT_resolved2b_2023.txt',$DATACARDS_DIR'/TT_resolved2b_2023BPix.txt',$DATACARDS_DIR'/TT_VBF_boosted_2023.txt',$DATACARDS_DIR'/TT_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/TT_VBF_resolved_2023.txt',$DATACARDS_DIR'/TT_VBF_resolved_2023BPix.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_boosted_2023.txt',$DATACARDS_DIR'/SR_GGF_boosted_2023BPix.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2023.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2023BPix.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2023.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2023BPix.txt',$DATACARDS_DIR'/SR_VBF_boosted_2023.txt',$DATACARDS_DIR'/SR_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/SR_VBF_resolved_2023.txt',$DATACARDS_DIR'/SR_VBF_resolved_2023BPix.txt',$DATACARDS_DIR'/DY_boosted_2023.txt',$DATACARDS_DIR'/DY_boosted_2023BPix.txt',$DATACARDS_DIR'/DY_resolved1b_2023.txt',$DATACARDS_DIR'/DY_resolved1b_2023BPix.txt',$DATACARDS_DIR'/DY_resolved2b_2023.txt',$DATACARDS_DIR'/DY_resolved2b_2023BPix.txt',$DATACARDS_DIR'/DY_VBF_boosted_2023.txt',$DATACARDS_DIR'/DY_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/DY_VBF_resolved_2023.txt',$DATACARDS_DIR'/DY_VBF_resolved_2023BPix.txt',$DATACARDS_DIR'/TT_boosted_2023.txt',$DATACARDS_DIR'/TT_boosted_2023BPix.txt',$DATACARDS_DIR'/TT_resolved1b_2023.txt',$DATACARDS_DIR'/TT_resolved1b_2023BPix.txt',$DATACARDS_DIR'/TT_resolved2b_2023.txt',$DATACARDS_DIR'/TT_resolved2b_2023BPix.txt',$DATACARDS_DIR'/TT_VBF_boosted_2023.txt',$DATACARDS_DIR'/TT_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/TT_VBF_resolved_2023.txt',$DATACARDS_DIR'/TT_VBF_resolved_2023BPix.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/2023_all_combined_datacard.txt'

# combine datacards from 2022 and 2023
law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt'

# copy the combined datacard
output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/combined_datacard.txt'

# combine ggF datacards

law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_boosted_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2022.txt',$DATACARDS_DIR'/SR_GGF_boosted_2023.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2023.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2023.txt',$DATACARDS_DIR'/DY_boosted_2022.txt',$DATACARDS_DIR'/DY_resolved1b_2022.txt',$DATACARDS_DIR'/DY_resolved2b_2022.txt',$DATACARDS_DIR'/DY_boosted_2023.txt',$DATACARDS_DIR'/DY_resolved1b_2023.txt',$DATACARDS_DIR'/DY_resolved2b_2023.txt',$DATACARDS_DIR'/TT_boosted_2022.txt',$DATACARDS_DIR'/TT_resolved1b_2022.txt',$DATACARDS_DIR'/TT_resolved2b_2022.txt',$DATACARDS_DIR'/TT_boosted_2023.txt',$DATACARDS_DIR'/TT_resolved1b_2023.txt',$DATACARDS_DIR'/TT_resolved2b_2023.txt'


output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_boosted_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2022.txt',$DATACARDS_DIR'/SR_GGF_boosted_2023.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2023.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2023.txt',$DATACARDS_DIR'/DY_boosted_2022.txt',$DATACARDS_DIR'/DY_resolved1b_2022.txt',$DATACARDS_DIR'/DY_resolved2b_2022.txt',$DATACARDS_DIR'/DY_boosted_2023.txt',$DATACARDS_DIR'/DY_resolved1b_2023.txt',$DATACARDS_DIR'/DY_resolved2b_2023.txt',$DATACARDS_DIR'/TT_boosted_2022.txt',$DATACARDS_DIR'/TT_resolved1b_2022.txt',$DATACARDS_DIR'/TT_resolved2b_2022.txt',$DATACARDS_DIR'/TT_boosted_2023.txt',$DATACARDS_DIR'/TT_resolved1b_2023.txt',$DATACARDS_DIR'/TT_resolved2b_2023.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/ggF_combined_datacard.txt'

# combine VBF datacards

law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_VBF_boosted_2022.txt',$DATACARDS_DIR'/SR_VBF_resolved_2022.txt',$DATACARDS_DIR'/SR_VBF_boosted_2023.txt',$DATACARDS_DIR'/SR_VBF_resolved_2023.txt',$DATACARDS_DIR'/DY_VBF_boosted_2022.txt',$DATACARDS_DIR'/DY_VBF_resolved_2022.txt',$DATACARDS_DIR'/DY_VBF_boosted_2023.txt',$DATACARDS_DIR'/DY_VBF_resolved_2023.txt',$DATACARDS_DIR'/TT_VBF_boosted_2022.txt',$DATACARDS_DIR'/TT_VBF_resolved_2022.txt',$DATACARDS_DIR'/TT_VBF_boosted_2023.txt',$DATACARDS_DIR'/TT_VBF_resolved_2023.txt'

output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_VBF_boosted_2022.txt',$DATACARDS_DIR'/SR_VBF_resolved_2022.txt',$DATACARDS_DIR'/SR_VBF_boosted_2023.txt',$DATACARDS_DIR'/SR_VBF_resolved_2023.txt',$DATACARDS_DIR'/DY_VBF_boosted_2022.txt',$DATACARDS_DIR'/DY_VBF_resolved_2022.txt',$DATACARDS_DIR'/DY_VBF_boosted_2023.txt',$DATACARDS_DIR'/DY_VBF_resolved_2023.txt',$DATACARDS_DIR'/TT_VBF_boosted_2022.txt',$DATACARDS_DIR'/TT_VBF_resolved_2022.txt',$DATACARDS_DIR'/TT_VBF_boosted_2023.txt',$DATACARDS_DIR'/TT_VBF_resolved_2023.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/VBF_combined_datacard.txt'

# combined 1b,2b,boosted,VBF datacards

law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_resolved1b_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2023.txt',$DATACARDS_DIR'/DY_resolved1b_2022.txt',$DATACARDS_DIR'/DY_resolved1b_2023.txt',$DATACARDS_DIR'/TT_resolved1b_2022.txt',$DATACARDS_DIR'/TT_resolved1b_2023.txt'

output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_resolved1b_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved1b_2023.txt',$DATACARDS_DIR'/DY_resolved1b_2022.txt',$DATACARDS_DIR'/DY_resolved1b_2023.txt',$DATACARDS_DIR'/TT_resolved1b_2022.txt',$DATACARDS_DIR'/TT_resolved1b_2023.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/1b_combined_datacard.txt'

law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_resolved2b_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2023.txt',$DATACARDS_DIR'/DY_resolved2b_2022.txt',$DATACARDS_DIR'/DY_resolved2b_2023.txt',$DATACARDS_DIR'/TT_resolved2b_2022.txt',$DATACARDS_DIR'/TT_resolved2b_2023.txt'

output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_resolved2b_2022.txt',$DATACARDS_DIR'/SR_GGF_resolved2b_2023.txt',$DATACARDS_DIR'/DY_resolved2b_2022.txt',$DATACARDS_DIR'/DY_resolved2b_2023.txt',$DATACARDS_DIR'/TT_resolved2b_2022.txt',$DATACARDS_DIR'/TT_resolved2b_2023.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/2b_combined_datacard.txt'

law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_boosted_2022.txt',$DATACARDS_DIR'/SR_GGF_boosted_2023.txt',$DATACARDS_DIR'/DY_boosted_2022.txt',$DATACARDS_DIR'/DY_boosted_2023.txt',$DATACARDS_DIR'/TT_boosted_2022.txt',$DATACARDS_DIR'/TT_boosted_2023.txt'

output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_GGF_boosted_2022.txt',$DATACARDS_DIR'/SR_GGF_boosted_2023.txt',$DATACARDS_DIR'/DY_boosted_2022.txt',$DATACARDS_DIR'/DY_boosted_2023.txt',$DATACARDS_DIR'/TT_boosted_2022.txt',$DATACARDS_DIR'/TT_boosted_2023.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/boosted_combined_datacard.txt'

law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_VBF_boosted_2022.txt',$DATACARDS_DIR'/SR_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/SR_VBF_boosted_2023.txt',$DATACARDS_DIR'/SR_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/DY_VBF_boosted_2022.txt',$DATACARDS_DIR'/DY_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/DY_VBF_boosted_2023.txt',$DATACARDS_DIR'/DY_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/TT_VBF_boosted_2022.txt',$DATACARDS_DIR'/TT_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/TT_VBF_boosted_2023.txt',$DATACARDS_DIR'/TT_VBF_boosted_2023BPix.txt'

output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_VBF_boosted_2022.txt',$DATACARDS_DIR'/SR_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/SR_VBF_boosted_2023.txt',$DATACARDS_DIR'/SR_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/DY_VBF_boosted_2022.txt',$DATACARDS_DIR'/DY_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/DY_VBF_boosted_2023.txt',$DATACARDS_DIR'/DY_VBF_boosted_2023BPix.txt',$DATACARDS_DIR'/TT_VBF_boosted_2022.txt',$DATACARDS_DIR'/TT_VBF_boosted_2022EE.txt',$DATACARDS_DIR'/TT_VBF_boosted_2023.txt',$DATACARDS_DIR'/TT_VBF_boosted_2023BPix.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/VBF_boosted_combined_datacard.txt'

law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_VBF_resolved_2022.txt',$DATACARDS_DIR'/SR_VBF_resolved_2022EE.txt',$DATACARDS_DIR'/SR_VBF_resolved_2023.txt',$DATACARDS_DIR'/SR_VBF_resolved_2023BPix.txt',$DATACARDS_DIR'/DY_VBF_resolved_2022.txt',$DATACARDS_DIR'/DY_VBF_resolved_2022EE.txt',$DATACARDS_DIR'/DY_VBF_resolved_2023.txt',$DATACARDS_DIR'/DY_VBF_resolved_2023BPix.txt',$DATACARDS_DIR'/TT_VBF_resolved_2022.txt',$DATACARDS_DIR'/TT_VBF_resolved_2022EE.txt',$DATACARDS_DIR'/TT_VBF_resolved_2023.txt',$DATACARDS_DIR'/TT_VBF_resolved_2023BPix.txt'

output_path=$(law run CombineDatacards --version $VERSION  --datacards $DATACARDS_DIR'/SR_VBF_resolved_2022.txt',$DATACARDS_DIR'/SR_VBF_resolved_2022EE.txt',$DATACARDS_DIR'/SR_VBF_resolved_2023.txt',$DATACARDS_DIR'/SR_VBF_resolved_2023BPix.txt',$DATACARDS_DIR'/DY_VBF_resolved_2022.txt',$DATACARDS_DIR'/DY_VBF_resolved_2022EE.txt',$DATACARDS_DIR'/DY_VBF_resolved_2023.txt',$DATACARDS_DIR'/DY_VBF_resolved_2023BPix.txt',$DATACARDS_DIR'/TT_VBF_resolved_2022.txt',$DATACARDS_DIR'/TT_VBF_resolved_2022EE.txt',$DATACARDS_DIR'/TT_VBF_resolved_2023.txt',$DATACARDS_DIR'/TT_VBF_resolved_2023BPix.txt' --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $DATACARDS_DIR'/VBF_resolved_combined_datacard.txt'









# run PlotUpperLimitsAtPoint task - "2022,2023,Combined"
law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt':$DATACARDS_DIR'/2023_all_combined_datacard.txt':$DATACARDS_DIR'/combined_datacard.txt' --datacard-names "2022,2023,Combined" --cms-postfix "Private work (CMS data/simulation)" --unblinded True --workers 64 # --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1

# copy the upper limit plot
output_path=$(law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt':$DATACARDS_DIR'/2023_all_combined_datacard.txt':$DATACARDS_DIR'/combined_datacard.txt' --datacard-names "2022,2023,Combined" --cms-postfix "Private work (CMS data/simulation)" --unblinded True --workers 64 --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

mkdir -p $BASE_DIR'/results/'$VERSION'/'

cp "$output_path" $BASE_DIR'/results/'$VERSION'/2022_2023_combined_upper_limits_at_point.pdf'


# run PlotUpperLimitsAtPoint task - "1b,2b,Boosted,VBF r, VBF b, Combined"

law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARDS_DIR'/1b_combined_datacard.txt':$DATACARDS_DIR'/2b_combined_datacard.txt':$DATACARDS_DIR'/boosted_combined_datacard.txt':$DATACARDS_DIR'/VBF_resolved_combined_datacard.txt':$DATACARDS_DIR'/VBF_boosted_combined_datacard.txt':$DATACARDS_DIR'/combined_datacard.txt' --datacard-names "ggF 1b,ggF 2b,ggF Boosted,VBF resolved,VBF boosted,Combined" --workers 1 --cms-postfix "Private work (CMS data/simulation)" --unblinded True --workers 64 #--UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1 

# copy the upper limit plot
output_path=$(law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARDS_DIR'/1b_combined_datacard.txt':$DATACARDS_DIR'/2b_combined_datacard.txt':$DATACARDS_DIR'/boosted_combined_datacard.txt':$DATACARDS_DIR'/VBF_resolved_combined_datacard.txt':$DATACARDS_DIR'/VBF_boosted_combined_datacard.txt':$DATACARDS_DIR'/combined_datacard.txt' --datacard-names "ggF 1b,ggF 2b,ggF Boosted,VBF resolved,VBF boosted,Combined" --workers 1 --cms-postfix "Private work (CMS data/simulation)" --unblinded True --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1  --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'/results/'$VERSION'/2022_2023_topology_combined_upper_limits_at_point.pdf'


# run PlotUpperLimitsAtPoint task - "ggF,VBF,Combined"

law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARDS_DIR'/ggF_combined_datacard.txt':$DATACARDS_DIR'/VBF_combined_datacard.txt':$DATACARDS_DIR'/combined_datacard.txt' --datacard-names "ggF,VBF,Combined" --workers 1 --cms-postfix "Private work (CMS data/simulation)" --unblinded True --workers 64 #--UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1  

# copy the upper limit plot
output_path=$(law run PlotUpperLimitsAtPoint --version $VERSION  --multi-datacards $DATACARDS_DIR'/ggF_combined_datacard.txt':$DATACARDS_DIR'/VBF_combined_datacard.txt':$DATACARDS_DIR'/combined_datacard.txt' --datacard-names "ggF,VBF,Combined" --workers 1 --cms-postfix "Private work (CMS data/simulation)" --unblinded True --workers 64  --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'/results/'$VERSION'/2022_2023_ggF_VBF_combined_upper_limits_at_point.pdf'







# run pulls and impacts
law run PlotPullsAndImpacts --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --campaign '2022+2023' --PullsAndImpacts-workflow htcondor --order-by-impact  --unblinded True --use-snapshot --cms-postfix "Private work (CMS data/simulation)" # --page 0  

# copy the pulls and impacts plot
output_path=$(law run PlotPullsAndImpacts --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --campaign '2022+2023' --PullsAndImpacts-workflow htcondor --unblinded True --use-snapshot --order-by-impact --print-out 0 --parameters-per-page 30  --unblinded True | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_pulls_and_impacts.pdf'






# run PlotUpperLimits task (kl scan)
law run PlotUpperLimits --version $VERSION --datacards $DATACARDS_DIR'/combined_datacard.txt' --xsec fb --scan-parameters kl,-20,24,23 --y-log --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1   --unblinded True --use-snapshot True --save-ranges  

output_path=$(law run PlotUpperLimits --version $VERSION --datacards $DATACARDS_DIR'/combined_datacard.txt' --xsec fb --scan-parameters kl,-20,24,23 --y-log --workers 1 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1   --unblinded True --use-snapshot True --save-ranges --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_kl_scan.pdf'




# run PlotUpperLimits task (C2V scan)
law run PlotUpperLimits --version $VERSION --datacards $DATACARDS_DIR'/combined_datacard.txt' --xsec fb --scan-parameters C2V,-6,8,15 --y-log --workers 1 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1  --unblinded True --use-snapshot True   --save-ranges  

output_path=$(law run PlotUpperLimits --version $VERSION --datacards $DATACARDS_DIR'/combined_datacard.txt' --xsec fb --scan-parameters C2V,-6,8,29 --y-log --workers 1 --UpperLimits-workflow htcondor --UpperLimits-tasks-per-job 1   --unblinded True --save-ranges  --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_C2V_scan.pdf'








# PlotLikelihoodScan - kl
law run PlotLikelihoodScan  --version $VERSION  --datacards $DATACARDS_DIR'/combined_datacard.txt'  --pois kl --scan-parameters kl,-20,25,91 --workers 1 --LikelihoodScan-workflow htcondor --unblinded True --use-snapshot True # --print-out 0

output_path=$(law run PlotLikelihoodScan  --version $VERSION  --datacards $DATACARDS_DIR'/combined_datacard.txt' --pois kl --scan-parameters kl,-20,25,91 --workers 1 --LikelihoodScan-workflow htcondor --unblinded True --use-snapshot True --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_kl_likelihood_scan.pdf'





# Likelihoodscan - C2V
law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/combined_datacard.txt' --pois C2V --scan-parameters C2V,-2,4,13 --LikelihoodScan-workflow htcondor --unblinded True --use-snapshot True

output_path=$(law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/combined_datacard.txt' --pois C2V --scan-parameters C2V,-2,4,13 --LikelihoodScan-workflow htcondor --unblinded True --use-snapshot True --print-out 0 | grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_k2V_likelihood_scan.pdf'






# 2d scan of kl and k2V
law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --pois kl,C2V --scan-parameters kl,-20,26,47:C2V,-5,7,13 --LikelihoodScan-workflow htcondor --LikelihoodScan-tasks-per-job 1 --unblinded True --use-snapshot True --cms-postfix "Private work (CMS data/simulation)" --show-significances 1,2  

output_path=$(law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --pois kl,C2V --scan-parameters kl,-20,26,47:C2V,-5,7,13 --LikelihoodScan-workflow htcondor --LikelihoodScan-tasks-per-job 1 --unblinded True --use-snapshot True --cms-postfix "Private work (CMS data/simulation)" --show-significances 1,2 --print-out 0| grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_kl_k2V_2D_scan.pdf'



# goodness of fit test 

law run PlotMultipleGoodnessOfFits --version $VERSION --multi-datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt':$DATACARDS_DIR'/2023_all_combined_datacard.txt':$DATACARDS_DIR'/combined_datacard.txt' --datacard-names 2022,2023,Combined --toys 1000 --toys-per-branch 20 --frequentist-toys --GoodnessOfFit-workflow htcondor --use-snapshot True --cms-postfix "Private work (CMS data/simulation)"  







law run PlotMultipleGoodnessOfFits --version $VERSION --multi-datacards $DATACARDS_DIR'/ggF_combined_datacard.txt':$DATACARDS_DIR'/VBF_combined_datacard.txt':$DATACARDS_DIR'/combined_datacard.txt' --datacard-names ggF,VBF,Combined --toys 1000 --toys-per-branch 20 --frequentist-toys --cms-postfix "Private work (CMS data/simulation)" --use-snapshot True --workers 64 # --GoodnessOfFit-workflow htcondor 









# 2d scan of kl and kt
law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --pois kl,kt --scan-parameters kl,-40,30:kt,-10,10 --LikelihoodScan-workflow htcondor --LikelihoodScan-tasks-per-job 1 --unblinded True

output_path=$(law run PlotLikelihoodScan --version $VERSION --datacards $DATACARDS_DIR'/2022_all_combined_datacard.txt',$DATACARDS_DIR'/2023_all_combined_datacard.txt',$DATACARDS_DIR'/combined_datacard.txt' --pois kl,kt --scan-parameters kl,-40,30:kt,-10,10 --LikelihoodScan-workflow htcondor --LikelihoodScan-tasks-per-job 1 --unblinded True --print-out 0| grep -o 'file://.*' | sed 's|file://||')

cp "$output_path" $BASE_DIR'results/'$VERSION'/2022_2023_kl_kt_2D_scan.pdf'

