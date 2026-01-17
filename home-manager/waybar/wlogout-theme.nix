/*
css
*/
''
  * {
    background-image: none;
    box-shadow: none;
  }

  window {
    background-color: rgba(26, 27, 38, 0.95);
  }

  button {
    color: #c0caf5;
    background-color: #1f2335;
    border-style: solid;
    border-width: 2px;
    background-repeat: no-repeat;
    background-position: center;
    background-size: 25%;
    border-radius: 12px;
    border-color: #414868;
    margin: 10px;
    transition: all 0.3s ease;
  }

  button:focus,
  button:active,
  button:hover {
    background-color: #24283b;
    border-color: #7aa2f7;
    outline-style: none;
    box-shadow: 0 0 20px rgba(122, 162, 247, 0.3);
  }

  #lock {
    background-image: image(url("${./icons/padlock.png}"));
  }

  #logout {
    background-image: image(url("${./icons/logout.png}"));
  }

  #suspend,
  #sleep {
    background-image: image(url("${./icons/sleep.png}"));
  }

  #hibernate {
    background-image: image(url("${./icons/hibernating.png}"));
  }

  #shutdown {
    background-image: image(url("${./icons/power.png}"));
  }

  #reboot {
    background-image: image(url("${./icons/restart.png}"));
  }

  #lock:hover {
    border-color: #7aa2f7;
    box-shadow: 0 0 25px rgba(122, 162, 247, 0.4);
  }

  #logout:hover {
    border-color: #f7768e;
    box-shadow: 0 0 25px rgba(247, 118, 142, 0.4);
  }

  #sleep:hover,
  #suspend:hover {
    border-color: #9ece6a;
    box-shadow: 0 0 25px rgba(158, 206, 106, 0.4);
  }

  #hibernate:hover {
    border-color: #bb9af7;
    box-shadow: 0 0 25px rgba(187, 154, 247, 0.4);
  }

  #shutdown:hover {
    border-color: #f7768e;
    box-shadow: 0 0 25px rgba(247, 118, 142, 0.4);
  }

  #reboot:hover {
    border-color: #e0af68;
    box-shadow: 0 0 25px rgba(224, 175, 104, 0.4);
  }
''
