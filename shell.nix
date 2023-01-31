with import <nixpkgs> {};

stdenv.mkDerivation {
name = "python-env";

buildInputs = [
  vagrant
];

SOURCE_DATE_EPOCH = 315532800;
PROJDIR = "${toString ./.}";

shellHook = ''
  cd vagrant
  vagrant plugin repair
  vagrant up --provider=libvirt
  '';
}  