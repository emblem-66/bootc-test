# Functions for Fedora

# Terra repos
function f_terra(){
	curl -o /etc/yum.repos.d/terra.repo "https://raw.githubusercontent.com/terrapkg/subatomic-repos/main/terra.repo"
	dnf install -y terra-release
}

# RPM-fusion
function f_rpmfusion(){
	dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
	dnf install -y https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
}

# Fedora auto updates
function f_updates(){
	sudo sed -i 's/#AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
	sudo sed -i 's/#LockLayering=false/LockLayering=true/' /etc/rpm-ostreed.conf
	systemctl enable rpm-ostreed-automatic.timer
}

# Flatpak auto updates
function f_flatpak(){
	echo -e "[Unit]\nDescription=Update Flatpaks\n[Service]\nType=oneshot\nExecStart=/usr/bin/flatpak update -y\n[Install]\nWantedBy=default.target\n" | sudo tee ~/etc/systemd/system/flatpak-update.service
	systemctl enable flatpak-update.service
	echo -e "[Unit]\nDescription=Update Flatpaks\n[Timer]\nOnCalendar=*:0/4\nPersistent=true\n[Install]\nWantedBy=timers.target\n" | sudo tee ~/etc/systemd/system/flatpak-update.timer
	systemctl enable flatpak-update.timer
}

# Multimedia
function f_multimedia(){
	dnf group install -y multimedia
}

# Fonts
function f_fonts(){
	install_packages=(
	"ibm-plex-fonts-all"
	"rsms-inter-fonts"
	"levien-inconsolata-fonts"
	)
	dnf install -y ${install_packages[@]}
}

# CachyOS Kernel
function f_cachy(){
	setsebool -P domain_kernel_load_modules on
	dnf copr enable -y bieszczaders/kernel-cachyos
	dnf install -y kernel-cachyos kernel-cachyos-devel-matched
}

# Mesa-git
function f_mesa-git(){
	dnf copr enable -y xxmitsu/mesa-git
}

# Gaming
function f_gaming(){
	# Fedora
	dnf install -y goverlay mangohud gamemode gamescope vkBasalt
	# RPM Fusion
	dnf install -y steam steam-devices
	# Terra
	dnf install -y umu-launcher
	# COPR
	dnf copr enable -y gui1ty/bottles
	dnf install -y bottles
	dnf copr enable -y atim/heroic-games-launcher
	dnf install -y heroic-games-launcher-bin
	dnf copr enable -y g3tchoo/prismlauncher
	dnf install -y prismlauncher
	dnf copr enable -y faugus/faugus-launcher
	dnf install -y faugus-launcher
}

# GNOME
function f_gnome(){
	remove_packages=(
	"gnome-classic-session"
	"gnome-shell-extension-window-list"
	"gnome-shell-extension-background-logo"
	"gnome-shell-extension-launch-new-instance"
	"gnome-shell-extension-apps-menu"
	"gnome-shell-extension-places-menu"
	"gnome-tour"
	"yelp"
	"yelp-libs"
	"yelp-xsl"
	)
	dnf remove -y ${remove_packages[@]}
	
	install_packages=(
	"adw-gtk3-theme"
	"gnome-shell-extension-caffeine"
	"gnome-shell-extension-light-style"
	"gnome-shell-extension-just-perfection"
	)
	dnf install -y ${install_packages[@]}

	install_applications=(
	"ffmpegthumbnailer"
	"gnome-tweaks"
	"clapper"
	"gnome-text-editor"
	"loupe"
	)
	dnf install -y ${install_applications[@]}
	
	git clone https://github.com/mukul29/legacy-theme-auto-switcher-gnome-extension.git /usr/share/gnome-shell/extensions/legacyschemeautoswitcher@joshimukul29.gmail.com
	git clone https://github.com/joaophi/tailscale-gnome-qs.git /tmp && mv /tmp/tailscale@joaophi.github.com /usr/share/gnome-shell/extensions/
}

# Tailscale
function f_tailscale(){
	#curl -o /etc/yum.repos.d/_tailscale.repo "https://pkgs.tailscale.com/stable/fedora/tailscale.repo"
	#dnf install -y tailscale
	#systemctl enable tailscaled
	dnf config-manager -y addrepo --from-repofile=https://pkgs.tailscale.com/stable/fedora/tailscale.repo
	dnf install -y tailscale
	systemctl enable tailscaled
}

# Distrobox
function f_distrobox(){
	dnf remove -y toolbox
	dnf install -y distrobox

	cat <<EOF | sudo tee /etc/systemd/system/distrobox-upgrade.service > /dev/null
[Unit]
Description=distrobox-upgrade Automatic Update
 
[Service]
Type=simple
ExecStart=distrobox-upgrade --all
StandardOutput=null
EOF
	
	cat <<EOF | sudo tee /etc/systemd/system/distrobox-upgrade.timer > /dev/null
[Unit]
Description=distrobox-upgrade Automatic Update Trigger
 
[Timer]
OnBootSec=1h
OnUnitInactiveSec=1d
 
[Install]
WantedBy=timers.target
EOF
	
	systemctl enable distrobox-upgrade.timer
}

# Sublime Text
function f_sublime(){
	#curl -o /etc/yum.repos.d/sublime.repo "https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo"
	#dnf install -y sublime-text
	rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
	dnf config-manager -y addrepo --from-repofile=https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
	#dnf config-manager -y addrepo --from-repofile=https://download.sublimetext.com/rpm/dev/x86_64/sublime-text.repo
	dnf install -y sublime-text
#	cat <<EOF | sudo tee /etc/yum.repos.d/sublime-text.repo > /dev/null
#[sublime-text]
#name=Sublime Text - x86_64 - Stable
#baseurl=https://download.sublimetext.com/rpm/stable/x86_64
#enabled=1
#gpgcheck=1
#gpgkey=https://download.sublimetext.com/sublimehq-rpm-pub.gpg
#EOF
#	dnf install -y sublime-text
}

# Cleanup
function f_cleanup(){
	# Firefox
	dnf remove -y firefox firefox-langpacks
	# Cleanup
	dnf upgrade -y
	dnf autoremove -y
}
