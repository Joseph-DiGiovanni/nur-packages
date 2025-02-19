{ pkgs ? import <nixpkgs> { } }:

{
  adwaita-for-steam = pkgs.callPackage ./pkgs/adwaita-for-steam { };
  mkvextract-gtk = pkgs.callPackage ./pkgs/mkvextract-gtk { };
  plymouth-theme-neat = pkgs.callPackage ./pkgs/plymouth-theme-neat { };
}
