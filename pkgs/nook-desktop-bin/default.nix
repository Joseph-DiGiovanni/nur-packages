{ asar, electron, p7zip, pkgs, makeWrapper }:

pkgs.stdenv.mkDerivation rec {
  pname = "nook-desktop-bin";
  version = "1.0.10";

  src = pkgs.fetchurl {
    url = "https://github.com/mn6/nook-desktop/releases/download/v${version}/nook-desktop-${version}-x64.nsis.7z";
    sha256 = "sha256-yxV2UNYLUrrK6iwxFCozA9/btDseYcyuQJk3E7KRE5c=";
  };

  nativeBuildInputs = [ p7zip asar makeWrapper ];
  buildInputs = [ electron ];

  unpackPhase = "7z x $src";

  installPhase = ''
    mkdir -p $out/${pname}
    asar e ./**/app.asar $out/${pname}/app
    find $out/${pname}/app -type f -path "*/node_modules/*/bin/*" -delete
    find $out/${pname}/app -type f \( -name "bin.js" -or -name "cli.js" \) -path "*/node_modules/*" -delete
    find $out/${pname} -type d -empty -delete
  '';

  postFixup = ''
    mkdir -p $out/bin
    makeWrapper ${electron}/bin/electron $out/bin/nook-desktop --add-flags $out/${pname}/app
  '';

  meta = with pkgs.lib; {
    description = "Plays Animal Crossing music on the hour";
    homepage = "https://github.com/mn6/nook-desktop";
    license = licenses.unfree;
    mainProgram = "nook-desktop";
    maintainers = with maintainers; [ Joseph-DiGiovanni ];
    platforms = platforms.all;
  };
}
