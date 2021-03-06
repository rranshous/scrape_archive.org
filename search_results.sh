CATEGORY=$1
OUTDIR=$2
SEARCH_URL="https://archive.org/search.php?query=subject:\"$CATEGORY\" AND mediatype:movies"
echo "OUTDIR: $OUTDIR"
cd "$OUTDIR"
for i in $(seq 1 20);
do
  echo "$CATEGORY PAGE $i"
  wget -q "$SEARCH_URL&page=$i" -O - | \
    grep "titleLink" | \
    cut -d'"' -f14 | \
    grep details | \
    xargs -I{} echo "https://archive.org/{}" | \
    xargs -I{} wget -q "{}" -O - | \
     grep "mp4" | \
     cut -d'"' -f4 | \
     grep "archive.org" | \
     xargs -I{} wget -nv -nc {} 2>&1
done
