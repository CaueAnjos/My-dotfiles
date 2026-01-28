palette: {
  colourful = true;
  filekinds = {
    normal = {foreground = "${palette.base05}";};
    directory = {foreground = "${palette.base0D}";};
    symlink = {foreground = "${palette.base0C}";};
    pipe = {foreground = "${palette.base03}";};
    block_device = {foreground = "${palette.base0A}";};
    char_device = {foreground = "${palette.base0A}";};
    socket = {foreground = "${palette.base03}";};
    special = {foreground = "${palette.base0E}";};
    executable = {foreground = "${palette.base0B}";};
    mount_point = {foreground = "${palette.base0C}";};
  };
  perms = {
    user_read = {foreground = "${palette.base0C}";};
    user_write = {foreground = "${palette.base0E}";};
    user_execute_file = {foreground = "${palette.base0B}";};
    user_execute_other = {foreground = "${palette.base0B}";};
    group_read = {foreground = "${palette.base0C}";};
    group_write = {foreground = "${palette.base09}";};
    group_execute = {foreground = "${palette.base0B}";};
    other_read = {foreground = "${palette.base0C}";};
    other_write = {foreground = "${palette.base08}";};
    other_execute = {foreground = "${palette.base0B}";};
    special_user_file = {foreground = "${palette.base08}";};
    special_other = {foreground = "${palette.base08}";};
    attribute = {foreground = "${palette.base03}";};
  };
  size = {
    major = {foreground = "${palette.base0C}";};
    minor = {foreground = "${palette.base0E}";};
    number_byte = {foreground = "${palette.base04}";};
    number_kilo = {foreground = "${palette.base0C}";};
    number_mega = {foreground = "${palette.base0C}";};
    number_giga = {foreground = "${palette.base09}";};
    number_huge = {foreground = "${palette.base08}";};
    unit_byte = {foreground = "${palette.base04}";};
    unit_kilo = {foreground = "${palette.base0C}";};
    unit_mega = {foreground = "${palette.base0C}";};
    unit_giga = {foreground = "${palette.base09}";};
    unit_huge = {foreground = "${palette.base08}";};
  };
  users = {
    user_you = {foreground = "${palette.base0D}";};
    user_root = {foreground = "${palette.base0E}";};
    user_other = {foreground = "${palette.base0C}";};
    group_yours = {foreground = "${palette.base0C}";};
    group_root = {foreground = "${palette.base0E}";};
    group_other = {foreground = "${palette.base05}";};
  };
  links = {
    normal = {foreground = "${palette.base0C}";};
    multi_link_file = {foreground = "${palette.base0C}";};
  };
  git = {
    new = {foreground = "${palette.base0B}";};
    modified = {foreground = "${palette.base0E}";};
    deleted = {foreground = "${palette.base08}";};
    renamed = {foreground = "${palette.base0C}";};
    typechange = {foreground = "${palette.base0C}";};
    ignored = {foreground = "${palette.base03}";};
    conflicted = {foreground = "${palette.base09}";};
  };
  git_repo = {
    branch_main = {foreground = "${palette.base03}";};
    branch_other = {foreground = "${palette.base0C}";};
    git_clean = {foreground = "${palette.base02}";};
    git_dirty = {foreground = "${palette.base0E}";};
  };
  security_context = {
    colon = {foreground = "${palette.base03}";};
    user = {foreground = "${palette.base03}";};
    role = {foreground = "${palette.base0C}";};
    typ = {foreground = "${palette.base0D}";};
    range = {foreground = "${palette.base0E}";};
  };
  file_type = {
    image = {foreground = "${palette.base0C}";};
    video = {foreground = "${palette.base0C}";};
    music = {foreground = "${palette.base0C}";};
    lossless = {foreground = "${palette.base0C}";};
    crypto = {foreground = "${palette.base08}";};
    document = {foreground = "${palette.base04}";};
    compressed = {foreground = "${palette.base09}";};
    temp = {foreground = "${palette.base03}";};
    compiled = {foreground = "${palette.base03}";};
    build = {foreground = "${palette.base0B}";};
    source = {foreground = "${palette.base0E}";};
  };
  punctuation = {foreground = "${palette.base02}";};
  date = {foreground = "${palette.base0A}";};
  inode = {foreground = "${palette.base03}";};
  blocks = {foreground = "${palette.base03}";};
  header = {foreground = "${palette.base04}";};
  octal = {foreground = "${palette.base09}";};
  flags = {foreground = "${palette.base0E}";};
  symlink_path = {foreground = "${palette.base0C}";};
  control_char = {foreground = "${palette.base09}";};
  broken_symlink = {foreground = "${palette.base08}";};
  broken_path_overlay = {foreground = "${palette.base08}";};
}
