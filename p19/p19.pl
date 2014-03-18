#!/usr/bin/perl

$sum = 0;
foreach(1901 .. 2000 ) {
        $o = `cal $_ | grep -o "1  2  3  4  5  6  7" | wc -l`;
        $sum += int($o);
}
print "$sum\n";
