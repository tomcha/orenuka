#!/usr/bin/env perl

use strict;
use warnings;

use Data::Dumper;

use lib "./lib";
use nukaduke;

pickle('./nukadoko.yaml', 'きゅうり');

my $now_nukadoko = lookin('./nukadoko.yaml');
print Dumper $now_nukadoko;

splice @$now_nukadoko, 3, 1;
print "---------------------------\n";
print Dumper $now_nukadoko;
takeout('./nukadoko.yaml', $now_nukadoko);
