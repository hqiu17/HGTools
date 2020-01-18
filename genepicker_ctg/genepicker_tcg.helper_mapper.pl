#! /usr/bin/perl
#
# map2ctg.pl 1-map 2-attribute 3-attribute
	
my @a= @ARGV;
my @b= @a;
my $map = shift (@a);

%feature=();
foreach my $file (@a) {
		open (IN, $file) or die "cant open file1 $file\n";
		print "reading $file\n";
		while (<IN>) {
		        s/\n//; 
		 	 	s/\s.*$//;
		 	 	my $a = $_;
		       	#s/^[^\.]+\.//;
		       	s/xx_2ref\S+$//;
		       	s/_2ref\S+$//;
		       	$feature{$_} = "OOO".$a;
		}
		close (IN);
}

open (MAP, $map) or die "cant open file2 $map\n";
#$map =~ s/\.txt$//;
open (OUT, ">$map.load.txt") or die "cof $map.load.txt\n";
open (Log, ">$map.load.log.txt");
print Log "010.map2ctg2.pl", "\\\n", join ("\\\n", @b), "\n";

my $ctg_tmp="xxx";
while (<MAP>) { s/\n//;
	my @b =split /\s+/;
	#/^(\S+)\s/;
	my $gene = $b[0];
	my $ctig = $b[2];
	
	if ($ctig eq $ctg_tmp) {
	} else {
		print OUT "\n";
		$ctg_tmp=$ctig;
	}
	
	if (exists $feature{$gene}) {
		print OUT $_, "\t", $feature{$gene}, "\n";
	} else {
		print OUT $_, "\n";
	}
}
