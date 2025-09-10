let
  importAllNixRecursive = dir: let
    inherit (builtins) readDir filter match attrNames;
    entries = readDir dir;
    nixFiles = filter (name: match ".*\\.nix$" name != null && name != "default.nix") (attrNames entries);
    directories = filter (name: entries.${name} == "directory") (attrNames entries);
  in
    (map (name: dir + "/${name}") nixFiles)
    ++ (builtins.concatLists (map (d: importAllNixRecursive (dir + "/${d}")) directories));
in {
  imports = importAllNixRecursive ./.;
}
