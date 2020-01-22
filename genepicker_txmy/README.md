# genepicker_txmy

genepicker_txmy.pl pickes genes based on their taxonomical origins.

### Quick run
Download everything this directory to local disk (e.g., ~/Desktop/HGTools/ genepicker_txmy). Change direcotry in the folder in terminal console:
```
cd ~/Desktop/HGTools/ genepicker_txmy
```
The directory contains scripts (\*.pl) and example input files (\*.txt). The file 'example.genes.txt' include one gene per row. To make a shortened list with up to 60 genes that contains ≤6 gene per phylum and ≤6 gene per class, type the following command:
```
./genepicker_txmy.pl example_genes.txt 
```
A new list of genes will be exported to output file ‘example_genes.txt.txt’.

### Customized run
To process your own data, in the input gene file, gene identifiers have to contain taxonomical information. An example gene identifier that works is as follow:

Chromalveolata.Stramenopiles--Oomycetes--Phytophthora_infestans.XP_002909070.1

This identifier contains the following information:

Phylum: Chromalveolata.Stramenopiles

Class: Oomycetes

Gene id: Phytophthora_infestans.XP_002909070.1

Only the first column containing gene identifier in the input file is read by the script. Other columns do not matter but are included in the output file together with the gene identifier-column.
