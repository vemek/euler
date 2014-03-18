#!/usr/bin/perl

###
### NOTE: this solution is inefficient!
### See p12.py for a version that uses a lookup
### table of previous calculated factors...
###


## What is the value of the first triangle number to have over five hundred divisors?
## http://projecteuler.net/index.php?section=problems&id=12

use strict;
use warnings;

# subs #
sub trianglenumbergenerator
{
	my $index = 0;
	my $trianglenumber = 0;
	return sub { ++$index; $trianglenumber += $index; return $trianglenumber; };
}

sub divisors
{
	my ($num) = @_;
	my $divisors = 1; # include the number itself
	for my $i(1 .. ($num / 2))
	{
		if($num % $i == 0)
		{
			++$divisors;
		}
	}

	return $divisors;
}

# main #
print "finding first triangular number with over five hundred divisors..\n";

my $hardlimit = 10000; # failsafe ;)
my ($numdivisors, $start) = 500; # the number of divisors we want
my $nexttriangle = trianglenumbergenerator();
my $highest_t = 0;
my $highest_d = 0;
my $last_output = 0;

# find the solution! #
for my $i($start .. $hardlimit)
{
	my $trianglenumber = $nexttriangle->();
	my $divisors = divisors($trianglenumber);

	if($divisors > $highest_d)
	{
		$last_output = 0;
		$highest_d = $divisors;
		$highest_t = $trianglenumber;
		print 'highest num divisors is ' . $highest_d . ' at ' . $highest_t . '(' . ($highest_d * 100 / $numdivisors) . "% there)\n";
	}

	if($divisors > $numdivisors)
	{
		print "Found it!\nAnswer: " . $trianglenumber . "\n";
		last;
	}

	if($last_output > 1000)
	{
		$last_output = 0;
		print "Don't worry, folks - we're still searching! [" . $i . " / " . $hardlimit . "]\n";
	}

	$last_output++;
}
