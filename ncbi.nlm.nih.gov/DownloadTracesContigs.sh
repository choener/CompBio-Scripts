#!/usr/bin/env bash

# Given an accession number of a species, extract the contigs link and download it.

if [ ! -z "$1" ]
then
  SRC="https://www.ncbi.nlm.nih.gov/Traces/wgs/$1\?display\=contigs\&page\=1"
  echo "$SRC"
  wget -O $1.tmp $SRC
  TGT=`grep FASTA $1.tmp | grep -o -P '(?=https).*(?=gz")' | head -n1`
  TGT+="gz"
  rm $1.tmp
  echo "$TGT"
  wget $TGT
fi

