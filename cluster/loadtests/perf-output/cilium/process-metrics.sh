#!/bin/bash

for i in `ls *.metric`; do
  grep -E 'bpf_syscall|endpoint_regeneration' $i  | awk '{arr[$1]+=$4} END {for (i in arr) {print i,arr[i]}}' > $i.sums
done

for i in `ls.sums`; do
  echo -n "$i: "
  cat $i
done > metric-sums

awk '{print $1, ($2-prev)*1000, prev=$2; }' metric-sums > diffs

