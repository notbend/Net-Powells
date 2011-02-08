package Net::Powells::v0a;
use Moose;
use URI;
use LWP::Simple; 
use JSON;

our $VERSION = 0.001_1;

has api_key =>
   is => 'ro',
   isa => 'Str',
   required => 1,
;

has api_base_url => 
   is => 'ro',
   isa => 'Str', # TODO: be more strict
   lazy => 1,
   default => sub{
      sprintf q{http://api.powells.com/v0a/%s}, shift->api_key
   },
;

has ua => 
   is => 'rw',
   isa => 'LWP::UserAgent',
   lazy => 1,
   default => sub{
      require LWP::UserAgent;
      my $ua = LWP::UserAgent->new; 
      $ua->agent("Net::Powells::v0a/$VERSION ");
      $ua->env_proxy;
      return $ua;
   },
   handles => [qw{get}],
;

around get => sub{
   my $next = shift;
   my $self = shift;
   my $noun = shift;
   my $value= shift;

   die unless defined $noun && length $noun;

   my %opts = @_;
   my $page = delete $opts{page};

   my $url = URI->new(join '/', grep{defined} $self->api_base_url, $noun, $value, $page);
   $url->query_form(\%opts);
   
   return from_json( $self->$next( $url->as_string )->content );
};

sub inventory      { shift->get(inventory => @_); }
sub product        { shift->get(product => @_); }
sub content        { shift->get(content => @_); }
sub locations      { shift->get(locations => @_); }
sub search         { shift->get(search => @_); }
sub recommendation { shift->get(recommendation => @_); }
sub apistatus      { shift->get(apistatus => @_); }



# ok were done with things so lets lock things down so that we can gain some speed back.
no Moose;
__PACKAGE__->meta->make_immutable;

1;
