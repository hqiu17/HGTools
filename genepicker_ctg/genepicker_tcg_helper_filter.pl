# take fasta sequence file as input and
# count number of sequences based on '>' and
# count unique sequence definition

my $in = shift;
my $len_cut = 4;
my $hgt_den = "0.5";

open (IN, $in) or die "cof $in\n";
#$in =~ s/\.txt$//;
my $out1= "$in.$len_cut\g.$hgt_den\hgt.txt";
my $out0= "$in.$len_cut\g.$hgt_den\hgt.rm.txt";
open (OUT1, ">$out1");
open (OUT0, ">$out0");

## load map into memmory
$num = 1;
while (<IN>) {
	if (/^\s*$/) {
		$num++;
	} else {
		push ( @{ $all{$num} }, $_);
	}
}

## filter contig one by one
my $keep=0;
my $remv=0;
foreach (sort {$a <=> $b} keys %all) {
	my @a = @{ $all{$_} }; 
	my $len = $#a+1;
	## count the hgt number
	my $hgt_count=0;
	foreach (@a) {
		if (/OOO/) {
			$hgt_count+=1;
		}
	}
	## test 1) test if ratio of hgt larger than cutoff
	## test 2) test the length of contig
	if ( ($hgt_count/$len) > $hgt_den or $len < $len_cut ) {
		print OUT0 join ("", @a), "\n";
		$remv += $hgt_count;
		next;
	} else {
		print OUT1 join ("", @a), "\n";
		$keep += $hgt_count;
	}
}
print $keep+$remv, " hgt in total\n";

my $srate = $keep/($keep+$remv);
$srate = substr ($srate, 0, 4);
my $log_file = "$in\__" . ($keep+$remv) . "\__$keep\__$remv\__$srate";
print "$log_file\n";
system ("touch $log_file");

