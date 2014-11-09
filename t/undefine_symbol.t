use strict;
use warnings;
use 5.010;
use FindBin ();
use lib $FindBin::Bin;
use testlib;
use Test::More tests => 4;
use FFI::TinyCC;

my $tcc = FFI::TinyCC->new;

eval { $tcc->define_symbol('FOO') };
is $@, '', 'tcc.define_symbol';

eval { $tcc->undefine_symbol('FOO') };
is $@, '', 'tcc.undefine_symbol';

eval { $tcc->compile_string(q{
int
main(int argc, char *argv[])
{
#ifdef FOO
  return 2;
#else
  return 0;
#endif
}
})};
is $@, '', 'tcc.compile_string';

is $tcc->run, 0, 'tcc.run';
