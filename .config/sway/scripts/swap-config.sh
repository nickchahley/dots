#!/bin/bash

if [ "$1" == "def" ]; then
	trash-put config
	ln -s -v default.config config
elif [ "$1" == "me" ]; then
	trash-put config
	ln -s -v my.config config
elif [ "$1" == "tiny" ]; then
	trash-put config
	ln -s -v tiny.config config
elif [ "$1" == "trouble" ]; then
	trash-put config
	ln -s -v troubleshoot.config config
fi
