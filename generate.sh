#!/bin/bash
{
  IFS=,
  while read -r index template station; do
    inkscape --export-filename=out_$template/$index-$station.png -w 512 <(sed "s/PLACEHOLDER/$station/" template_$template.svg)
  done;
} < list.csv
