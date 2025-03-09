{ pkgs ? import <nixpkgs> { } }:

with pkgs;

{
  adwaita-for-steam = callPackage ./pkgs/adwaita-for-steam { };
  mkvextract-gtk = callPackage ./pkgs/mkvextract-gtk { };
  nook-desktop-bin = callPackage ./pkgs/nook-desktop-bin { };
  plymouth-theme-neat = callPackage ./pkgs/plymouth-theme-neat { };
}
