#!/bin/sh

GREEN="\033[32m"
RED="\033[31m"
DEFAULTC="\033[0m"

echo "${GREEN}Setting up git$DEFAULTC"
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

echo "\n${RED}Git configured with:$DEFAULTC"
echo "${GREEN}user.name:       ${DEFAULTC}$GITNAME"
echo "${GREEN}user.email:      ${DEFAULTC}$GITEMAIL"
echo "${GREEN}core.editor:     ${DEFAULTC}$GITEDITOR"
echo "${GREEN}pull.rebase:     ${DEFAULTC}false (merge)"
if [[ $answer = [Yy] ]] 
then
echo "${GREEN}commit.codesign: ${DEFAULTC}true"
echo "${GREEN}gpg.program:     ${DEFAULTC}gpg2"
echo "${GREEN}user.signingkey: ${DEFAULTC}$GPGKEYID"
else
echo "${GREEN}commit.codesign: ${DEFAULTC}false"
fi