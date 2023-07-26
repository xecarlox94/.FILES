
echo "add funtion to add to path list env variable"
echo "add text file to list all paths folders to be added"

export_subfolder_rec() {
  PATH_LIST=$(find "$1" -type d -printf ':%p');
  export PATH="$PATH:$PATH_LIST"
}

export_subfolder_rec $HOME/.config/.FILES/scripts/.config/scripts/_scripts
