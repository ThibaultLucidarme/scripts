#!/bin/sh

gsettings set com.canonical.indicator.session suppress-restart-menuitem true
gsettings set com.canonical.indicator.session user-show-menu false
gsettings set com.canonical.indicator.keyboard visible false
gsettings set com.canonical.indicator.appmenu.hud store-usage-data false

gsettings set com.canonical.Unity.Dash scopes "['home.scope', 'applications.scope', 'files.scope']"
gsettings set com.canonical.Unity.Lenses always-search "['applications.scope', 'files.scope']"
gsettings set com.canonical.Unity.Lenses home-lens-default-view "['applications.scope']"
gsettings set com.canonical.Unity.Lenses home-lens-priority "['applications.scope']"
gsettings set com.canonical.Unity.Lenses remote-content-search none
gsettings set com.canonical.Unity.ApplicationsLens display-available-apps false
gsettings set com.canonical.Unity.FilesLens use-locate false

gsettings set org.gnome.desktop.media-handling automount false
gsettings set org.gnome.desktop.media-handling automount-open false
gsettings set org.gnome.desktop.media-handling autorun-never true

gsettings set org.gnome.desktop.privacy remember-app-usage false
gsettings set org.gnome.desktop.privacy remember-recent-files false
