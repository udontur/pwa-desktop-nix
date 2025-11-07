# LeetCode Electron Wrapper

### Template
You can make another URL electron app by simply changing the URL on line `13` of the `main.js` file.

### Running electron
Clone into the repository and do `electron .`.

Add electron-packager `npm install --save-dev @electron/packager`
Package the electorn app `npx @electron/packager . leetcode-electron --platform=linux --arch=x64`
The resulting binary is in `./leetcode-electron-linux-x64/leetcode-electron`

### Zoom in and out
Electron has different zoom in and zoom out keys:
- `ctrl + shift + =` to Zoom in
- `ctrl + -` to Zoom out

## TODO
- [ ] Persistance data (local storage)
- [ ] Package it using Nix flakes