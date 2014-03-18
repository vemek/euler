#!/usr/bin/perl

## How many routes are there through a 20x20 grid? ##
## http://projecteuler.net/index.php?section=problems&id=15 ##

use strict;
use warnings;

# subs #
sub permutate
{
	my ($res, $v) = @_;
	my @vals = @{$v};
	if(length($res) == 0)
	{
		return $vals[0];
	}
	else
	{
		my $i = 0;
		my %rev_vals = map {$_, $i++} @vals;
		my $currindex = $rev_vals{substr($res, length($res) - 1, 1)};
		if($currindex < $#vals)
		{
			return substr($res, 0, length($res) - 1) . $vals[$currindex + 1];
		}
		else
		{
			return permutate(substr($res, 0, length($res) - 1), \@vals) . $vals[0];
		}
	}
}

# main #
my ($w, $h) = (20, 20);
my $v = [qw(R D)];
my $val = 'R' x ($w+$h);
my @paths;
my $numpaths = 0;

print 'searching for number of valid paths through a ' . $w . 'x' . $h . " grid..\n";
print 'permutating..';
do
{
	push @paths, $val;
	$val = permutate($val, $v);
}
while(length($val) <= $w + $h);

print "finished.\nsearching for valid paths..";
for (@paths)
{
	if(tr/R// == $w && tr/D// == $h)
	{
		++$numpaths;
	}
}

print "finished.\n" . $numpaths . " valid paths found.\n";