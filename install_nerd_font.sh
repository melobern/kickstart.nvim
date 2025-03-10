#!/bin/bash

# Télécharge la police
if [ $(id -u) -eq 0 ]; then
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip -O /home/$SUDO_USER/Téléchargements/JetBrainsMono.zip
else
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip -O /home/$USER/Téléchargements/JetBrainsMono.zip
fi

# Vérifie si le téléchargement a réussi
if [ $? -ne 0 ]; then
    echo "Erreur lors du téléchargement."
    exit 1
fi

# Vérifie si unzip est installé
if ! command -v unzip &> /dev/null; then
    echo "Unzip n'est pas installé. Veuillez l'installer avant de continuer."
    exit 1
fi

# Détermine le répertoire de destination en fonction des privilèges
if [ $(id -u) -eq 0 ]; then
    # Pour tous les utilisateurs
    unzip /home/$SUDO_USER/Téléchargements/JetBrainsMono.zip -d /usr/share/fonts/
else
    # Pour l'utilisateur actuel
    unzip /home/$USER/Téléchargements/JetBrainsMono.zip -d ~/.local/share/fonts/
fi

# Vérifie si fc-cache est disponible
if ! command -v fc-cache &> /dev/null; then
    echo "fc-cache n'est pas disponible. Veuillez installer fontconfig avant de continuer."
    exit 1
fi

# Reconstruit le cache des polices
fc-cache -fv


# wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip -O ~/Téléchargements/JetBrainsMono.zip
# if [ "$1" -eq "sudo"];
# then
# # Pour l'utilisateur actuel
# 	unzip ~/Téléchargements/JetBrainsMono.zip -d ~/.local/share/fonts/
# # Pour tous les utilisateurs (nécessite sudo)
# else
# 	unzip ~/Téléchargements/JetBrainsMono.zip -d /usr/share/fonts/
# fi
# #Reconstruit le cache des polices
# fc-cache -fv
