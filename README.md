# PWA Desktop Nix
An intuitive Progressive Web App (PWA) Electron wrapper template that turns your PWA into a usable desktop application in Nix with just a URL!

## Using the template
### Customizing
It's dead simple! Simply change the content of [config.json](./config.json) and you're done!

### Testing
You can test it by building and running it. 
```
nix run .
```

## Installation
You can install your PWA application via Nix Flakes. 
  1. Add the url to your <code>flake.nix</code> input:
  <pre lang="nix">inputs = {
  APP_NAME.url = "github:udontur/REPONAME";
  # ...
};</pre>
  
  2. Add the package in <code>environment.systemPackages</code>:
  <pre lang="nix">environment.systemPackages = with pkgs; [
  inputs.APP_NAME.packages."${system}".default
  # ...
];</pre>
  3. Rebuild your configuration with Nix flakes enabled.
  <pre lang="sh">sudo nixos-rebuild switch --flake /PATH/TO/CONFIG#WORKSTATION_NAME</pre>
