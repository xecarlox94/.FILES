#!/bin/sh

cd ~/.FILES/

stow --ignore="\.steam.*" --adopt -Dt ~ *
