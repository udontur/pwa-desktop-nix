# PWA Desktop Nix
An intuitive Progressive Web App (PWA) Electron wrapper template that turns your PWA into a usable desktop application in Nix with just a URL!

## Using the template
### Customizing
It's dead simple! Simply change the content in [config.json](./config.json) and you're done!

### Testing
You can check if it works by building it and running it. 
```
nix run .
```

## Installation
You can install the application via Nix Flakes. 
  1. Add the url to your <code>flake.nix</code> input:
  <pre lang="nix">inputs = {
  APPNAME.url = "github:udontur/REPONAME";
  # ...
};</pre>
  
  2. Add the package in <code>environment.systemPackages</code>:
  <pre lang="nix">environment.systemPackages = with pkgs; [
  inputs.APPNAME.packages."${system}".default
  # ...
];</pre>
  3. Rebuild your configuration with Nix flakes enabled.
  <pre lang="sh">sudo nixos-rebuild switch --flake /PATH/TO/CONFIG#WORKSTATION_NAME</pre>


## TODO
- [x] Persistance data (local storage)
- [x] Make it change easily 
- [x] Make it appear on desktop
- [ ] Icon template
- [x] Write down template what need to do
- [x] Add keywords and description
- [x] make it look good