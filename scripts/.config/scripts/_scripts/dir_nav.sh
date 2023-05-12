




# add functions for get/set
# another 2 functions to "+timestamp" version"



save_dir() {
    export CURR_DIR=$(pwd)
}
export -f g_curr_dir



go_saved_dir() {
    cd $CURR_DIR
}
export -f go_saved_dir
