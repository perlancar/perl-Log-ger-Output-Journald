package Log::ger::Output::Journald;

# DATE
# VERSION

use strict 'subs', 'vars';
use warnings;

sub get_hooks {
    my %conf = @_;

    require Log::Journald;

    return {
        create_log_routine => [
            __PACKAGE__, 50,
            sub {
                my %args = @_;

                my $logger = sub {
                    my %log;
                    $log{PRIORITY} = ;
                    if (ref $_[1] eq 'HASH') {
                        $log{$_} = $_[1]{$_} for keys %{$_[1]};
                    } else {
                        $log{MESSAGE} = $_[1];
                    }
                    Log::Journald::send(%log) or warn $!;
                };
                [$logger];
            }],
    };
}

1;
# ABSTRACT: Send logs to journald

=for Pod::Coverage ^(.+)$

=head1 SYNOPSIS

 use Log::ger::Output 'Journald' => (
 );
 use Log::ger;

 log_warn "blah ...";


=head1 DESCRIPTION

This output plugin sends logs to journald using L<Log::Journald>.


=head1 CONFIGURATION


=head1 SEE ALSO

L<Log::ger>

L<Log::Journald>
