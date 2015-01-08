use strict;
use warnings;
use 5.010;
use FindBin ();
use lib $FindBin::Bin;
use testlib;
use Test::More;
use FFI::TinyCC;
use Config;
use File::Temp qw( tempdir );
use File::chdir;
use FFI::Raw;
use Path::Class qw( file dir );

plan skip_all => "unsupported on $^O" if $^O =~ /^(darwin|gnukfreebsd)$/;
plan skip_all => "unsupported on $^O $Config{archname}" if $^O eq 'linux' && $Config{archname} =~ /^arm/;
plan tests => 1;

subtest dll => sub {

  plan tests => 4;

  local $CWD = tempdir( CLEANUP => 1 );

  my $tcc = FFI::TinyCC->new;
  
  my $dll = file( $CWD, "bar." . FFI::TinyCC::_dlext() );
  
  eval { $tcc->set_output_type('dll') };
  is $@, '', 'tcc.set_output_type(dll)';
  
  $tcc->set_options('-D__WIN32__') if $^O eq 'MSWin32';
  
  eval { $tcc->compile_string(q{
    int
    bar()
#if __WIN32__
    __attribute__((dllexport))
#endif
    {
      return 47;
    }
  })};
  is $@, '', 'tcc.compile_string';

  note "dll=$dll";
  
  eval { $tcc->output_file($dll) };
  is $@, '', 'tcc.output_file';
  
  my $ffi = FFI::Raw->new(
    $dll, 'bar',
    FFI::Raw::int,
  );
  
  is $ffi->call(), 47, 'ffi.call';

};
