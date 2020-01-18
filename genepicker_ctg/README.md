# genepicker_ctg
genepicker_ctg removes genes located on short contigs and contigs predominated by bacterial-derived genes.

### Quick run
Download everything this directory to local disk (e.g., ~/Desktop/HGTools/genepicker_ctg). Change direcotry in the folder in terminal console:
```
cd ~/Desktop/HGTools/genepicker_ctg
```
The directory contains scripts (\*.pl and \*.sh) and example input files (\*.txt). The file 'example.glocation.txt' include host genes and their relative gene positions within their contigs. The file 'example.hgts.txt' includes a list of HGT candidates. To remove HGTs that are located in short contigs (containing <=4 genes) and contigs with 50% genes having HGT origins, type the following command:
```
./genepicker_tcg.sh example.glocation.txt example.hgts.txt 
```
Output files will be generated:

1. example.hgts.txt.pass.txt: contains HGTs that passed the location-based filtering.

2. example.hgts.txt.ctg_retained.txt: shows the locations of HGTs on their contigs. A contig is represented by its constituent genes ordered by their relative physical location. Different contigs are separated by blank lines.

3. example.hgts.txt.ctg_discarded.txt: shows the removed HGTs and their contigs.

### Customerized run
To porcess your own data, the gene location file has to be formatted as in the example file. Each row represents a gene and includes five columns separated by TABs:

column-1: gene identifier (must be identical to those in gene list file);

column-2: non-essential information;

column-3: contig identifier containing the gene;

column-2: relative gene positions in the contig;

column-2: precise position of gene in the contig (non-essential information);
