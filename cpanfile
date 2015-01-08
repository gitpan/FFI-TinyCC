requires "Carp" => "0";
requires "FFI::Raw" => "0.32";
requires "File::ShareDir" => "0";
requires "base" => "0";
requires "perl" => "5.010";

on 'build' => sub {
  requires "Alien::TinyCC" => "0";
  requires "Archive::Ar" => "2.02";
  requires "File::chdir" => "0";
  requires "IPC::System::Simple" => "0";
  requires "Module::Build" => "0.3601";
  requires "Path::Class" => "0.26";
  requires "autodie" => "0";
};

on 'test' => sub {
  requires "Alien::TinyCC" => "0";
  requires "Archive::Ar" => "2.02";
  requires "File::chdir" => "0";
  requires "Path::Class" => "0.26";
  requires "Test::More" => "0.94";
  requires "perl" => "5.010";
};

on 'configure' => sub {
  requires "Alien::TinyCC" => "0";
  requires "Archive::Ar" => "2.02";
  requires "File::chdir" => "0";
  requires "IPC::System::Simple" => "0";
  requires "Module::Build" => "0.3601";
  requires "Path::Class" => "0";
  requires "autodie" => "0";
  requires "perl" => "5.010";
};
