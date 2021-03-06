{ stdenv, fetchurl, automoc4, cmake, gettext, perl, pkgconfig
, kdelibs4, kgraphviewer }:

stdenv.mkDerivation rec {
  name = "massif-visualizer-${version}";
  version = "0.4.0";

  src = fetchurl {
    url = "mirror://kde/stable/massif-visualizer/${version}/src/${name}.tar.xz";
    sha256 = "0yawzp5lw7ryjcpqkhz70q4hc5hwq5imq5lgqnwgss057zcln7z8";
  };

  nativeBuildInputs = [ automoc4 cmake gettext perl pkgconfig ];
  buildInputs = [ kdelibs4 kgraphviewer ];

  meta = with stdenv.lib; {
    description = "Tool that visualizes massif data generated by valgrind";
    license = licenses.gpl2;
    platforms = platforms.linux;
    maintainers = [ maintainers.lethalman ];
  };
}
