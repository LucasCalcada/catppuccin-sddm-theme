# Catppuccin SDDM Theme
A sddm theme based on the ![official catppuccin sddm theme](https://github.com/catppuccin/sddm).
![Thumbnail](assets/example.png)
# Previews
<details>
<summary>🌻 Latte</summary>
<img src="assets/latte.png"/>
</details>
<details>
<summary>🪴 Frappé</summary>
<img src="assets/frappe.png"/>
</details>
<details>
<summary>🌺 Macchiato</summary>
<img src="assets/macchiato.png"/>
</details>
<details>
<summary>🌿 Mocha</summary>
<img src="assets/mocha.png"/>
</details>

# Installation
don't forget to replace ```<palette>``` with the desired theme palette
```
git clone https://github.com/LucasCalcada/catppuccin-sddm-theme
cd catppuccin-sddm-theme
cp catppuccin-<palette> /usr/share/sddm/themes
```

after that edit the config file at```/etc/sddm.conf``` with the desired palette

sddm.conf:
```
[Theme]
Current=catppuccin-<palette>
```
# Options
The theme has different distro logos to choose from

The logo can be changed by editing the ```theme.conf``` file

theme.conf
```
[General]
distroLogo="./distroLogos/<logo path>.svg"
...
```
the theme colors can be changed on the same file

### Available logos
| Distro | Latte | Frappé | Macchiato | Mocha |
|--------|-------|--------|-----------|-------|
| Arch | ![](catppuccin-latte/distroLogos/arch.svg)| ![](catppuccin-frappe/distroLogos/arch.svg) | ![](catppuccin-macchiato/distroLogos/arch.svg) | ![](catppuccin-mocha/distroLogos/arch.svg)|
| Debian | ![](catppuccin-latte/distroLogos/debian.svg)| ![](catppuccin-frappe/distroLogos/debian.svg) | ![](catppuccin-macchiato/distroLogos/debian.svg) | ![](catppuccin-mocha/distroLogos/debian.svg)|
| Fedora | ![](catppuccin-latte/distroLogos/fedora.svg)| ![](catppuccin-frappe/distroLogos/fedora.svg) | ![](catppuccin-macchiato/distroLogos/fedora.svg) | ![](catppuccin-mocha/distroLogos/fedora.svg)|
| Gentoo | ![](catppuccin-latte/distroLogos/gentoo.svg)| ![](catppuccin-frappe/distroLogos/gentoo.svg) | ![](catppuccin-macchiato/distroLogos/gentoo.svg) | ![](catppuccin-mocha/distroLogos/gentoo.svg)|
| Manjaro | ![](catppuccin-latte/distroLogos/manjaro.svg)| ![](catppuccin-frappe/distroLogos/manjaro.svg) | ![](catppuccin-macchiato/distroLogos/manjaro.svg) | ![](catppuccin-mocha/distroLogos/manjaro.svg)|
| Ubuntu | ![](catppuccin-latte/distroLogos/ubuntu.svg)| ![](catppuccin-frappe/distroLogos/ubuntu.svg) | ![](catppuccin-macchiato/distroLogos/ubuntu.svg) | ![](catppuccin-mocha/distroLogos/ubuntu.svg)|
