#set -x

file=$1
genes=$2

#perl 010.map2ctg2.pl $file.txt allAI.sorted.stay.txt
#perl 010.map2ctg2.pl $file $genes

perl genepicker_tcg.helper_mapper.pl $file $genes   >/dev/null

perl genepicker_tcg_helper_filter.pl $file.load.txt >/dev/null
#perl 011.filter4gut.pl $file.load.txt

perl -pe 'if(/\O\O\O(\S+)/){print"$1\n";}s/^.*\n//;' $file.load.txt.4g.0.5hgt.txt \
>$genes.pass.txt

mv $file.load.txt.4g.0.5hgt.rm.txt $genes.ctg_discarded.txt
mv $file.load.txt.4g.0.5hgt.txt $genes.ctg_retained.txt

rm $file.load.*
