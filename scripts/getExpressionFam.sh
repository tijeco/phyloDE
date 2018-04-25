tail -n +2 $1 |awk '{print $1}'|sed -e 's/_i//g' | awk -F"_TRINITY_" '{print "data/transformed/"$1"_quant_quant.sf.norm.sf"}' |sed -e 's/_trinity//g' > $1.paths.tmp.txt

tail -n +2 $1 |awk '{print $1}'|sed -e 's/_i//g' | sed -e 's/tvers/blank_tvers/g' |awk -F"TRINITY" '{print "TRINITY"$2}' > $1.genes.tmp.txt
echo "Name	Length	EffectiveLength	TPM	NumReads	norm	zscale	TPMpercentile" > $1.header

paste $1.genes.tmp.txt $1.paths.tmp.txt | awk '{print "grep \""$1"\\b\"", $2}'|bash > $1.quant.tmp.txt

#rm $1.genes.tmp.txt $1.paths.tmp.txt
cat $1.header $1.quant.tmp.txt > $1.quant.norm.sf
paste $1.quant.norm.sf $1 > $1.tsv
