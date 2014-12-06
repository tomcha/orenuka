#!/usr/bin/perl

use strict;
use warnings;
use utf8;

sub pickle{
  my $filepath = shift;
  my $vegetable = shift;
  chomp($filepath);
  chomp($vegetable);
  open my $fh, ">>", $filepath or die $!;
  my ($day, $month, $year) = (localtime(time))[3..5];
  $year += 1900;
  $month += 1;
  print $fh "$vegetable $year-$month-$day\n";
  close $fh;
  return 1;
}

sub lookin{
  my $filepath = shift;
  my @pickled_vegetables;
  chomp($filepath);
  open my $fh, "<", $filepath or die $!;
  my $i = 0;
  for my $pickledobject (<$fh>){
    chomp($pickledobject);
    my ($vegetable, $date) = split(" ", $pickledobject);
    push(@pickled_vegetables, {$i => [$vegetable,$date]});
    $i++;
  }
  close $fh;
  return \@pickled_vegetables;
}

sub takeout{
  my $filepath = shift;
  my $new_nukadoko = shift;
  chomp($filepath);
  open my $fh, ">", $filepath or die $!;
  for my $pickledobject (@$new_nukadoko){
    my @key = keys(%$pickledobject);
    print $fh "$pickledobject->{$key[0]}->[0] $pickledobject->{$key[0]}->[1]\n";
  }
  close $fh;
  return 1;
}

1;
