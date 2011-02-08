#!/usr/bin/perl 

use strict;
use warnings;

use Test::Most qw{no_plan};
use Carp::Always;
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
#ok my $api = Net::Powells::v0a->new( api_key => 'testing', api_version => 'v0x') ;
ok my $api = Net::Powells::v0a->new( api_key => 'testing') ;
isa_ok $api, 'Net::Powells::v0a', q{[Net::Powells::v0a] new()};

eq_or_diff
   $api->inventory('9780590353427', per_page => 2, debug => 1),
   {},
;

eq_or_diff
   $api->product('9780590353427'),
   {},
;





