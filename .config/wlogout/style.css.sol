* {
  background-image: none;
  box-shadow: none;
}

window {
  background-color: #002B36; 
}

button {
  border-radius: 6px;
  color: #8BA0A2; 
  background-color: #073642; 
  background-repeat: no-repeat;
  background-position: center;
  background-size: 9%;
  border: none;
  margin: 3px;
}

button:focus,
button:active,
button:hover {
  background-color: #7B9007;
  color: #002B36;
  outline-style: none;
}

#lock {
  background-image: image(url("/usr/share/wlogout/icons/lock.png"),
      url("/usr/local/share/wlogout/icons/lock.png"));
  background-blend-mode: multiply;
}

#logout {
  background-image: image(url("/usr/share/wlogout/icons/logout.png"),
      url("/usr/local/share/wlogout/icons/logout.png"));
  background-blend-mode: multiply;
}

#suspend {
  background-image: image(url("/usr/share/wlogout/icons/suspend.png"),
      url("/usr/local/share/wlogout/icons/suspend.png"));
  background-blend-mode: multiply;
}

#hibernate {
  background-image: image(url("/usr/share/wlogout/icons/hibernate.png"),
      url("/usr/local/share/wlogout/icons/hibernate.png"));
  background-blend-mode: multiply;
}

#shutdown {
  background-image: image(url("/usr/share/wlogout/icons/shutdown.png"),
      url("/usr/local/share/wlogout/icons/shutdown.png"));
  background-blend-mode: multiply;
}

#reboot {
  background-image: image(url("/usr/share/wlogout/icons/reboot.png"),
      url("/usr/local/share/wlogout/icons/reboot.png"));
  background-blend-mode: multiply;
}
