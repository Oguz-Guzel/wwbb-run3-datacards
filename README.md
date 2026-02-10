# wwbb-run3-datacards

Datacard production and statistical analysis workflow for the HH → WW + bb (dileptonic) analysis in CMS Run 3 (2022-2023).

## Overview

This repository contains the complete workflow for producing ROOT datacards used in the CMS statistical inference framework ([Combine](https://cms-analysis.github.io/HiggsAnalysis-CombinedLimit/)) for Higgs pair production studies in the WW + bb final state. The analysis uses dileptonic (dilepton) decay modes and includes multiple reconstruction categories:

- **Boosted**: High transverse momentum topology with AK8 jets
- **Resolved 1b**: Single b-tagged jet topology
- **Resolved 2b**: Two b-tagged jets topology  
- **VBF Boosted**: Vector boson fusion production with boosted topology
- **VBF Resolved**: Vector boson fusion production with resolved topology

## Data Periods

The analysis covers Run 3 data:
- **2022**: Pre-ECAL endcap upgrade (2022 pre-EE) and post-ECAL endcap upgrade (2022 post-EE)
- **2023**: Similar split handling for early data (2023) and post-BPix data (2023 BPix)
- **Combined**: Statistical combination across all years and periods

## Workflow

### 1. Datacard Production

Create datacards from processed histograms:

```bash
# Activate environment
source datacard_env/bin/activate

# Produce datacards for each year
python ../BambooDatacardProducer/produceDataCards.py --yaml config/config_2022.yml
python ../BambooDatacardProducer/produceDataCards.py --yaml config/config_2023.yml
python ../BambooDatacardProducer/produceDataCards.py --yaml config/config_combined.yml
```

The workflow is also automated in `datacardProducer.sh`.

### 2. Histogram Merging and Plotting

Merge plotIt outputs from different analysis jobs:

```bash
# Merge histograms from multiple sources
bash merge_plotit_all_eras.sh

# Or use the Python script directly for custom merging
python merge_plotit_all_eras_Version3.py
```

This creates merged ROOT files that serve as input to the datacard producer.

### 3. Combine Datacards and Run Statistical Analysis

#### Combined datacards for 2022:
```bash
bash UpperLimitProducer_2022.sh
```

This script:
- Combines individual category datacards
- Creates pre-EE and post-EE specific combinations
- Creates full 2022 combined datacard
- Prepares input for CMS Combine parametric inference

#### Similar workflows for 2023 and combined results:
```bash
bash UpperLimitProducer_2023.sh
bash UpperLimitProducer_combined.sh
```

## Directory Structure

```
config/               # YAML configuration files for datacard production
├── config_2022.yml
├── config_2023.yml
├── config_combined.yml
├── samples_2022.yml  # Sample definitions for 2022
├── samples_2023.yml  # Sample definitions for 2023
└── samples_*.yml     # Era-specific sample configurations

output/              # Generated datacards and analysis outputs
├── [bamboo_dir]/   # Organized by bamboo processing version
│   ├── DL_boosted_2022.txt
│   ├── DL_resolved1b_2022.txt
│   └── ...

results/            # Final statistical analysis results
build-plotit/       # Compiled plotIt visualization tool
datacard_env/       # Python virtual environment
```

## Configuration

The YAML configuration files define:
- Input ROOT file locations
- Sample definitions and cross-sections
- Systematic uncertainties (JES, JER, b-tagging, trigger, etc.)
- Bin definitions for different analysis categories
- Output datacard specifications

Example structure in `config_2022.yml`:
```yaml
input: /path/to/histograms.root
samples: config/samples_2022.yml
categories:
  - DL_boosted
  - DL_resolved1b
  - DL_resolved2b
  - DL_VBF_boosted
  - DL_VBF_resolved
systematics:
  # Defined in associated files
```

## Key Scripts

| Script | Purpose |
|--------|---------|
| `datacardProducer.sh` | Automate datacard production for all years |
| `merge_plotit_all_eras.sh` | Merge plotIt outputs before datacard creation |
| `merge_plotit_all_eras_Version3.py` | Python implementation of histogram merging |
| `UpperLimitProducer_2022.sh` | Combine datacards and prepare for 2022 inference |
| `UpperLimitProducer_2023.sh` | Combine datacards and prepare for 2023 inference |
| `UpperLimitProducer_combined.sh` | Combined Run 3 inference |

## Dependencies

- **Python 3.x** with required packages (specified in environment setup)
- **ROOT** (CERN's data analysis framework)
- **plotIt** (histogram visualization tool, included in build-plotit/)
- **BambooDatacardProducer** (parent directory - custom datacard generation framework)
- **CMS Combine** (for statistical inference, used via law framework)
- **law** (workflow management task runner)

## Environment Setup

The analysis requires a properly configured environment:

```bash
# Create/activate Python environment
python -m venv datacard_env
source datacard_env/bin/activate

# Install required packages
pip install -r requirements.txt  # if available, or use parent BambooDatacardProducer setup
```

The setup typically follows the [CMS HH analysis workflow](https://cms-hh.web.cern.ch/tools/inference/).

## Running at CERN

At CERN, use the EL7 container environment:

```bash
./start_el7.sh
# Then run the datacardProducer.sh or individual scripts
```

## Outputs

- **Datacards**: ROOT files following CMS Combine format with:
  - Signal and background templates
  - Systematic uncertainty nuisance parameters
  - Binned likelihood specifications
  
- **Combined Datacards**: Merged versions across categories
  - All categories combined
  - Era-specific combinations (pre-EE, post-EE)
  
- **Plots**: Visualization of final distributions and systematic impacts (in `output/v*/plotit/plots_Run3/`)

## Analysis Framework

This repository integrates with:
- **Bamboo**: Event selection, object definitions, and histogram production
- **BambooDatacardProducer**: Systematic uncertainty handling and datacard generation
- **CMS Combine**: Maximum likelihood inference for limits and measurements
- **plotIt**: Publication-ready histogram visualization

## Contact

For questions about the HH → WW + bb dileptonic analysis, refer to the main CMS HH analysis group documentation at cms-hh.web.cern.ch.

## References

- [CMS Analysis Statistical Methods](https://cms-hh.web.cern.ch/)
- [CMS Combine Tool](https://cms-analysis.github.io/HiggsAnalysis-CombinedLimit/)
- [CMS HH Inference Tools](https://cms-hh.web.cern.ch/tools/inference/)