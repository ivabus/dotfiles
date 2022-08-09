#!/bin/sh

echo "Setting up git"
read -p "Enter your name for commits: " GITNAME
git config --global user.name "$GITNAME"
read -p "Enter your email for commits: " GITEMAIL
git config --global user.email "$GITEMAIL"
read -p "Configure GPG signing for git? (y/N): " answer

if [[ $answer = [Yy] ]]; then
	git config --global commit.gpgsign true
	git config --global gpg.program gpg2
	read -p "Enter your GPG key ID: " GPGKEYID
	git config --global user.signingkey "${GPGKEYID}"
else
	git config --global commit.gpgsign false
fi

# configure git for merge
git config --global pull.rebase false
read -p "Enter your preferred editor (default: nvim): " GITEDITOR

if [ $GITEDITOR = ""]
then
	GITEDITOR="nvim"
fi
git config --global core.editor $GITEDITOR

echo "\nGit configured with:"
echo "user.name:       $GITNAME"
echo "user.email:      $GITEMAIL"
echo "core.editor:     $GITEDITOR"
echo "pull.rebase:     false (merge)"

if [[ $answer = [Yy] ]] 
then
echo "commit.codesign: true"
echo "gpg.program:     gpg2"
echo "user.signingkey: $GPGKEYID"
else
echo "commit.codesign: false"
fi
