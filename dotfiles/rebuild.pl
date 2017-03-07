#!/usr/bin/env perl

use 5.22.2;
use warnings;
use strict;

use File::Path;
use File::Basename;
use Parse::CPAN::Meta;

sub flatten {
    my $hash = shift;
    my $prefix = shift // '';
    my %flathash;

    foreach (keys %{$hash}) {
	my @cprefix = grep(length, ($prefix, $_));
        if (ref($hash->{$_}) eq "HASH") {
            %flathash = (%flathash, flatten($hash->{$_}, $_));
        } elsif (ref($hash->{$_}) eq "ARRAY") {
            while (my ($i, $v) = each(@{$hash->{$_}})) {
                $flathash{join('.', (@cprefix, $i))} = $v;
            }
        } else {
	    $flathash{join('.', @cprefix)} = $hash->{$_};
	}
    }
    return %flathash;
}

sub template {
    my $text = shift;
    my $vars = shift;

    foreach (keys %{$vars}) {
	my $find = quotemeta "<% $_ %>";
	my $replace = $vars->{$_};
        $text =~ s/$find/$replace/g
    }
    return $text;
}

sub dirwalk {
    my $dirname = shift;
    my $callback = shift;

    foreach (<$dirname/*>) {
        if (-d $_) { $callback->($_); dirwalk($_, $callback); }
        else { $callback->($_); }
    }
}

sub build {
    my ($flatconfig, $tdir, $bdir, $path) = @_;

    if (-d $path) {
        $path =~ s/$tdir/$bdir/;
        mkdir $path or die("Failed to create directory $path: $!");
    } else {
	open(my $ifh, "<:encoding(UTF-8)", $path)
            or die("Failed to open file $path: $!");

        $path =~ s/$tdir/$bdir/;
        open(my $ofh, ">:encoding(UTF-8)", $path)
            or die ("Failed to open file $path: $!");

	print $ofh map { template($_, $flatconfig) } <$ifh>;

	close($ifh)
            or warn("Failed to close file $path: $!");
	close($ofh)
            or warn("Failed to close file $path, $!");
    }
}

sub buildconf {
    my ($flatconfig, $tdir, $bdir) = @_;
    return sub {
        build($flatconfig, $tdir, $bdir, $_[0]);
    }
}

my $filepath   = $ARGV[0];
my $scriptdir  = dirname($0);
my $configpath = "$scriptdir/config.json";
my $config     = Parse::CPAN::Meta->load_file($configpath);
my %flatconfig = flatten($config);

rmtree("$scriptdir/build");
mkdir("$scriptdir/build");
dirwalk("$scriptdir/template", buildconf(\%flatconfig, 'template', 'build'));
