package Net::Powells::v0a;
use Moose;

has api_key =>
   is => 'ro',
   isa => 'Str',
   required => 1,
;

has api_base_url => 
   is => 'ro',
   isa => 'Str', # TODO: be more strict
   default => sub{
      sprintf q{http://api.powells.com/v0a/%s}, shift->api_key
   },
;

extends qw{Net::HTTP::API};

net_api_declare powells_api => (
   api_format      => 'json',
   api_format_mode => 'append',
);

net_api_method inventory => (
   description => 'Specific inventory data for a product.',
   method      => 'GET',
   path        => '/inventory/:pid',
   params      => [qw/pid/],
);

net_api_method product => (
   description => 'General data for a product.',
   method      => 'GET',
   path        => '/product/:pid',
   params      => [qw/pid/],
);

net_api_method content => (
   description => 'Content about a product.',
   method      => 'GET',
   path        => '/content/:pid',
   params      => [qw/pid/],
);

net_api_method locations => (
   description => 'Information about our retail locations.'
   method      => 'GET',
   path        => '/locations/:slug',
   params      => [qw/slug/],
);

net_api_method search => (
   description => 'Search for products given a keyword',
   method      => 'GET',
   path        => '/search/:kw',
   params      => [qw/kw/],
);

net_api_method recommendation => (
   description => 'Get recommendation for a product.',
   method      => 'GET',
   path        => '/recommendation/:pid',
   params      => [qw/pid/],
);

net_api_method apistatus => (
   description => 'Get the current status of the API',
   method      => 'GET',
   path        => '/apistatus',
);
