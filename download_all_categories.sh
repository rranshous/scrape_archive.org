OUTDIR=$1
cat categories.txt | xargs -I{} ./search_results.sh "{}" "$OUTDIR"
