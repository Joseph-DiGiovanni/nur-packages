# You can use this file as a nixpkgs overlay. This is useful in the
# case where you don't want to add the whole NUR namespace to your
# configuration.

final: prev:
let
  nameValuePair = n: v: { name = n; value = v; };
  nurAttrs = import ./default.nix { pkgs = prev; };
in
{
  nur-joseph-digiovanni = builtins.listToAttrs
    (map (n: nameValuePair n nurAttrs.${n})
      (builtins.attrNames nurAttrs));
}
