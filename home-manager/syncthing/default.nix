{
  services.syncthing = {
    enable = true;
    settings = {
      gui = {
        user = "kawid";
        password = "0914";
      };
      devices = {
        "phone" = {
          id = "R4KBHZE-4PSK5PL-3BZDH2P-25NVAFT-J5LG36W-YJRU6TW-GH3UWPQ-DG7ZMAI";
          autoAcceptFolders = false;
        };
      };
      folders = {
        obsidianVaults = {
          enable = true;
          lable = "Obsidain Vaults";
          path = "/home/kawid/Documents/obsidianVaults";
          devices = ["phone"];
        };
        images = {
          enable = true;
          lable = "Images";
          path = "/home/kawid/Documents/Images";
          devices = ["phone"];
        };
      };
    };
  };
}
