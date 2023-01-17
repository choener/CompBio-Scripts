#!/usr/bin/env bash

# Given a taxon id, will parse out the NCBI Assembly Accession and return it on the command line.

if [ ! -z "$1" ]
then
  SRC="https://img.jgi.doe.gov/cgi-bin/m/main.cgi?section=TaxonDetail&page=taxonDetail&taxon_oid=$1"
  #echo "$SRC"
  wget -O $1.tmp $SRC 2>/dev/null
  TGT=`grep 'NCBI Assembly Accession' $1.tmp -A1 | tail -n-1 | grep -o -P '(?<=onclick\=""\>).*(?=<\/a)'`
  rm $1.tmp
  echo "$TGT"
fi

