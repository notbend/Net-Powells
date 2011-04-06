package Net::Powells::Version::Generic;
use Moose;
use JSON;

has api_host =>
  is => 'ro',
  isa=> 'Str',
  default => '',
;

has
sub url {
  my $self = shift;
  my $url = sprintf q{http://%s/%s/%s/%s.json}
                    ,$self->api_host
                    ,$self->api_version
		    ,$self->api_key
                    ,join '/' @_;

}
sub get {
#something
}
1;



__END__
=pod

- Generic needs to be able to build a URL
- Generic needs to be able to build a request to that URL and collect the reply
- Generic needs to be able to understand if the body of the reply is proper JSON
- Generic needs to be able to unpack the JSON if valid
- each api_version object should be a subclass of generic
- each api_version object needs to supply any default that is relevant

=end

1;
