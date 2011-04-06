package Net::Powells::Version::v0a;
use Moose;

extends qw{Net::Powells::Version::Generic};

has '+api_version' => default => 'v0a';

sub inventory      { shift->get(inventory => @_); }
sub product        { shift->get(product => @_); }
sub content        { shift->get(content => @_); }
sub locations      { shift->get(locations => @_); }
sub search         { shift->get(search => @_); }
sub recommendation { shift->get(recommendation => @_); }
sub apistatus      { shift->get(apistatus => @_); }

1;
