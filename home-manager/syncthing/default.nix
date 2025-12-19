{
  services.syncthing = {
    enable = true;
    settings = {
      gui = {
        user = "kawid";
        password = "0914";
      };
      devices = {
        "CelularCaue" = {
          id = "R4KBHZE-4PSK5PL-3BZDH2P-25NVAFT-J5LG36W-YJRU6TW-GH3UWPQ-DG7ZMAI";
          autoAcceptFolders = true;
        };
      };
    };
  };
}
