#!/usr/bin/perl -n


if (/(^|[^.\d])(\d+[,\.]\d\d)($|[^.\d])/)
{
	$num=$2;
	$num =~ s/,/./;
	print "$num\n" ;
	#print "$num\n" ;
} elsif  (/(^|[^.,\d])((\d{1,3})( ?.?\d{3}),\d\d)($|[^.i,\d])/)
#} elsif  (/((\d{1,3})( ?.?\d{3}),\d\d)/)
{
	$num=$2;
	$num =~ s/\.//g;
	$num =~ s/,/./g;
	print "$num\n" ;
}
