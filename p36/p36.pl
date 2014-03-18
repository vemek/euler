#!/usr/bin/perl

## The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.
## Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
## http://projecteuler.net/index.php?section=problems&id=36

use strict;
use warnings;

# subs #
sub ispalindrome
{
	my ($string) = @_;
	my $palindrome = 1;
	for my $i(0 .. length($string) / 2)
	{
		if(substr($string, $i, 1) ne substr($string, length($string) - ($i + 1), 1))
		{
			$palindrome = 0;
			last;
		}
	}
	return $palindrome;
}

sub base10to2
{
	my ($num) = @_;
	my $result = "";

	while($num >= 1)
	{
		$result = ($num % 2) . $result;
		$num /= 2;
	}
	return $result;
}

# main #
my $hardlimit = 1000000;
my $total = 0;

print "searching for sum of palindroms..\n";

for my $i(1 .. $hardlimit)
{
	# only check odd numbers, as even binarys will be in form 1****0
	if($i % 2 != 0 && ispalindrome($i) && ispalindrome(base10to2($i)))
	{
		print $total . ': ' . $i . ' and ' . base10to2($i) . "\n";
		$total += $i;
	}
}

print "Finished!\nAnswer is: " . $total . "\n";
