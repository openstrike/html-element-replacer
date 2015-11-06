package TestUtils;

use FileHandle;
use File::Slurp;

use Carp qw(carp cluck croak confess);

require Exporter;
@ISA=qw(Exporter);
@EXPORT = qw(html_dir);

sub html_dir {
  't/html/'
}

1;
