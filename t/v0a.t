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

   use_ok 'Net::Powells::v0a';
   can_ok 'Net::Powells::v0a', 
          qw{  inventory
               product
               content
               locations
               search
               recommendation
               apistatus
          };
};
#-----------------------------------------------------------------
#  
#-----------------------------------------------------------------
ok my $api = Net::Powells::v0a->new( api_key => 'testing') ;
isa_ok $api, 'Net::Powells::v0a', q{[Net::Powells::v0a] new()};

eq_or_diff
   $api->apistatus,
   {},
   q{apistatus},
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
   






