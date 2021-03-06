{ stdenv, buildGoPackage, fetchFromGitHub, libargon2, pam }:

# Don't use this for anything important yet!

buildGoPackage rec {
  name = "fscrypt-${version}";
  version = "0.2.1";

  goPackagePath = "github.com/google/fscrypt";

  src = fetchFromGitHub {
    owner = "google";
    repo = "fscrypt";
    rev = version;
    sha256 = "0ais6l0dxinnspi6cjnzyk55cdkfsz2bzbaybg6cb4q8a5kzaccq";
  };

  buildInputs = [ libargon2 pam ];

  meta = with stdenv.lib; {
    description =
      "A high-level tool for the management of Linux filesystem encryption";
    longDescription = ''
      This tool manages metadata, key generation, key wrapping, PAM integration,
      and provides a uniform interface for creating and modifying encrypted
      directories.
    '';
    inherit (src.meta) homepage;
    license = licenses.asl20;
    platforms = platforms.linux;
    maintainers = with maintainers; [ primeos ];
  };
}
