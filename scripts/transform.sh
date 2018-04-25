cd data
for f in original/*quant.sf; do Rscript ../scripts/transform.R $f;done
mkdir transformed
mv original/*norm* transformed/
cd ..
