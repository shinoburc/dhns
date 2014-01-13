#!/usr/bin/perl
#
# $Id: index.cgi 171 2009-11-29 14:48:22Z dot $
#

use CGI;

my $cache_dir = 'cache';
my $session = 'default';

&main();

sub main {
    my $q = new CGI;
    print "Content-type:text/plain\n\n";

    if(defined($q->param('session'))){
        $session = $q->param('session');
    }

    if($q->param('mode') eq 'register'){
        if(!defined($q->param('ip')) or !defined($q->param('hostname'))){
            &fault;
            return;
        }
        &register($q->param('ip'), $q->param('hostname'), $session);
    } elsif($q->param('mode') eq 'clear') {
        &clear_session($session);
    } else {
        &print_result($session);
    }
}

sub register {
    my $ip = shift;
    my $hostname = shift;
    my $session = shift;
    my %hosts = ();

    if(-f $cache_dir . '/' . $session){
        open(IN, '<' . $cache_dir . '/' . $session) or die &fault;
        while(<IN>){
            chomp;
            my($ip, $hostname) = split /\s/;
            $hosts{$hostname} = $ip;
        }
        close(IN);
    }

    $hosts{$hostname} = $ip;

    open(OUT,'>' . $cache_dir . '/' . $session) or die &fault;
    foreach my $key(keys %hosts){
        print OUT $hosts{$key} . ' ' . $key . "\n";
    }
    close(OUT);
    &success($session);
}

sub clear_session{
    my $session = shift;
    my $file = $cache_dir . '/' . $session;

    &print_result($session);
    if(-f $file){
        unlink($file);
    }
}

sub print_result {
    my $session = shift;
    my $file = $cache_dir . '/' . $session;

    if(!-f $file){
        &fault;
        return;
    }
    &success($session);
}

sub fault{
    print 'fault'; 
}

sub success{
    my $session= shift;
    open(IN,'<' . $cache_dir . '/' . $session) or die &fault;
    while(<IN>){
        print $_;
    }
    close(IN);
}
