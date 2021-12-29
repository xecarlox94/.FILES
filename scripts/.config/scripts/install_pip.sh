#!/bin/sh

curl -s https://pypi.org/simple/ | tail -n +7 | head -n -2 | sed 's/<[^>]*>//g' | less
