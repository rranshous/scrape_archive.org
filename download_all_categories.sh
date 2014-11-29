OUTDIR=$1
echo "OUTDIR: $OUTDIR"
cat categories.txt | xargs -I{} mkdir -p "$OUTDIR/{}"
cat categories.txt | xargs -I{} ./search_results.sh "{}" "$OUTDIR/{}"
