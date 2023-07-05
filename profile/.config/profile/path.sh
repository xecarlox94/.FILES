
echo "add funtion to add to path list env variable"
echo "add text file to list all paths folders to be added"

export_folder_subfolders_rec() {
  EXPORT_PATH="$HOME/$1";
  PATH_LIST=$(find "$EXPORT_PATH" -type d -printf ':%p');
  export PATH="$PATH:$PATH_LIST"
}


export PATH="$PATH:$(find $HOME/.config/.FILES/scripts/.config/scripts/_scripts -type d -printf ':%p')"

export PATH="$PATH:$HOME/.local/bin"

export PATH="$PATH:$HOME/.local/share/python/bin"

export PATH="$PATH:$HOME/.config/emacs/bin"
