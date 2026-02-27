#!/usr/bin/env python3
"""
Scan ROOT files for shape systematics and rank them by their total yield impact.

For each nominal histogram h, the script looks for variations named h__SystUp/Down
in the same file. The impact per systematic is the sum over histograms of the
maximum absolute yield shift between Up/Down and nominal. Systematics are then
sorted by (total shift)/(total nominal yield) and printed from largest to smallest.
"""

import argparse
import glob
import os
import sys
from collections import defaultdict

import ROOT


def collect_histograms(root_file):
    """Return dictionaries of nominal yields and systematic variations in a file."""
    hists = {}
    # systs[base][syst_core][direction] = TH1
    systs = defaultdict(lambda: defaultdict(dict))
    for key in root_file.GetListOfKeys():
        name = key.GetName()
        obj = root_file.Get(name)
        if not obj or not obj.InheritsFrom("TH1"):
            continue
        if "__" in name:
            base, syst_full = name.split("__", 1)
            direction = None
            if syst_full.endswith("Up"):
                direction = "Up"
                syst_core = syst_full[:-2]
            elif syst_full.endswith("Down"):
                direction = "Down"
                syst_core = syst_full[:-4]
            else:
                syst_core = syst_full
                direction = "Alt"
            systs[base][syst_core][direction] = obj
        else:
            hists[name] = obj
    return hists, systs


def compute_impacts(files, min_yield):
    total_nominal = 0.0
    impact_num = defaultdict(float)

    for path in files:
        f = ROOT.TFile.Open(path)
        if not f or f.IsZombie():
            print(f"Warning: could not open {path}", file=sys.stderr)
            continue

        noms, systs = collect_histograms(f)
        for base, h_nom in noms.items():
            nom_yield = h_nom.Integral()
            total_nominal += nom_yield
            if base not in systs or nom_yield <= min_yield:
                continue
            for syst_core, dir_map in systs[base].items():
                up = dir_map.get("Up")
                down = dir_map.get("Down")
                alt = dir_map.get("Alt")

                deltas = []
                if up:
                    deltas.append(up.Integral() - nom_yield)
                if down:
                    deltas.append(down.Integral() - nom_yield)
                if not deltas and alt:
                    deltas.append(alt.Integral() - nom_yield)
                if not deltas:
                    continue

                shift = max(abs(d) for d in deltas)
                impact_num[syst_core] += abs(shift)

        f.Close()

    impacts = []
    for syst, shift in impact_num.items():
        frac = shift / total_nominal if total_nominal > 0 else 0.0
        impacts.append((syst, shift, frac))

    impacts.sort(key=lambda x: x[2], reverse=True)
    return impacts, total_nominal


def main():
    parser = argparse.ArgumentParser(description="Rank systematics by yield impact")
    parser.add_argument("input_dir", help="Directory containing ROOT files")
    parser.add_argument(
        "--pattern",
        default="*.root",
        help="Glob pattern inside the input directory (default: *.root)",
    )
    parser.add_argument(
        "--min-yield",
        type=float,
        default=1e-6,
        help="Skip histograms with nominal yield below this threshold",
    )
    parser.add_argument(
        "--top",
        type=int,
        default=0,
        help="If >0, limit output to the first N entries",
    )

    args = parser.parse_args()

    files = sorted(glob.glob(os.path.join(args.input_dir, args.pattern)))
    if not files:
        print("No files found; check directory/pattern", file=sys.stderr)
        sys.exit(1)

    impacts, total_nominal = compute_impacts(files, args.min_yield)
    print(f"Processed {len(files)} files; total nominal yield = {total_nominal:.3e}")
    print(f"Found {len(impacts)} systematics with variations")
    print("Systematic          AbsShift        Fraction")
    print("----------------------------------------------")
    count = 0
    for name, shift, frac in impacts:
        print(f"{name:20s} {shift:12.4e}   {frac:7.4f}")
        count += 1
        if args.top and count >= args.top:
            break


if __name__ == "__main__":
    main()