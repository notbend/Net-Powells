#!/usr/bin/perl 

use strict;
use warnings;

use Test::Most qw{no_plan};
#use Carp::Always;
BEGIN{ print qq{\n} for 1..10};

#-----------------------------------------------------------------
#  
#-----------------------------------------------------------------
BEGIN {

   use_ok 'Net::Powells::Version::Generic';
   can_ok 'Net::Powells::Version::Generic', 
          qw{  url
	       get 
          };
};
#-----------------------------------------------------------------
#  
#-----------------------------------------------------------------
ok my $api = Net::Powells::Version::Generic->new( api_key => 'testing'), 'make new object';
isa_ok $api, 'Net::Powells::Version::Generic', q{[Net::Powells::Version::Generic] new()};

eq_or_diff
   [$api->get],
   {},
   q{get},
;
__END__

for my $type (qw{inventory product content recommendation}) {
   is $api->$type('9780590353427')->{status},
      q{success},
      $type
   ;
}
is $api->search('perl')->{status},
   q{success},
   q{search},
;
is $api->locations->{status},
   q{success},
   q{search},
;
   






