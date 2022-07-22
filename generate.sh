#!/bin/bash
{
  IFS=,
  while read -r index template station; do
    cleaned_station=$(echo $station | sed -e 's/\\\//_/g')
    inkscape --export-filename="out_$template/$index-$cleaned_station.png" -w 512 <(sed "s/PLACEHOLDER/$station/" template_$template.svg)
  done;
} < list.csv
