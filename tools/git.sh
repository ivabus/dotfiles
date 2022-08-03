#!/bin/sh

GREEN="\033[32m"
RED="\033[31m"
CLEAR_COLOR="\033[0m"

echo "${GREEN}Setting up git$CLEAR_COLOR"
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

echo "\n${RED}Git configured with:$CLEAR_COLOR"
echo "${GREEN}user.name:       ${CLEAR_COLOR}$GITNAME"
echo "${GREEN}user.email:      ${CLEAR_COLOR}$GITEMAIL"
echo "${GREEN}core.editor:     ${CLEAR_COLOR}$GITEDITOR"
echo "${GREEN}pull.rebase:     ${CLEAR_COLOR}false (merge)"

if [[ $answer = [Yy] ]] 
then
echo "${GREEN}commit.codesign: ${CLEAR_COLOR}true"
echo "${GREEN}gpg.program:     ${CLEAR_COLOR}gpg2"
echo "${GREEN}user.signingkey: ${CLEAR_COLOR}$GPGKEYID"
else
echo "${GREEN}commit.codesign: ${CLEAR_COLOR}false"
fi