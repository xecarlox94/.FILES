#!/bin/sh

export PS1="\[\e[32m\][\[\e[m\]\[\e[37m\]\h\[\e[m\] \[\e[37m\]:\[\e[m\] \[\e[33;40m\]\u\[\e[m\]\[\e[32m\]]\[\e[m\] \[\e[32m\]\n\\$\[\e[m\] "

export LS_COLORS='*.7z=38;5;40:*.WARC=38;5;40:*.a=38;5;40:*.arj=38;5;40:*.bz2=38;5;40:*.cpio=38;5;40:*.gz=38;5;40:*.lrz=38;5;40:*.lz=38;5;40:*.lzma=38;5;40:*.lzo=38;5;40:*.rar=38;5;40:*.s7z=38;5;40:*.sz=38;5;40:*.tar=38;5;9:*.tbz=38;5;40:*.tgz=38;5;200:*.warc=38;5;40:*.xz=38;5;40:*.z=38;5;40:*.zip=38;5;40:*.zipx=38;5;40:*.zoo=38;5;40:*.zpaq=38;5;40:*.zst=38;5;40:*.zstd=38;5;40:*.zz=38;5;40:*@.service=38;5;45:*AUTHORS=38;5;220;1:*CHANGES=38;5;220;1:*CONTRIBUTORS=38;5;220;1:*COPYING=38;5;220;1:*COPYRIGHT=38;5;220;1:*CodeResources=38;5;239:*Dockerfile=38;5;51:*HISTORY=38;5;220;1:*INSTALL=38;5;220;1:*LICENSE=38;5;220;1:*LS_COLORS=48;5;89;38;5;197;1;3;4;7:*MANIFEST=38;5;243:*Makefile=38;5;155:*NOTICE=38;5;220;1:*PATENTS=38;5;220;1:*PkgInfo=38;5;239:*README=38;5;220;1:*README.md=38;5;220;1:*README.rst=38;5;220;1:*VERSION=38;5;220;1:*IMAGE=38;5;220;1:*ENVIRONMENT=38;5;220;1:*authorized_keys=1:*cfg=38;5;213:*conf=38;5;213:*config=38;5;213:*core=38;5;241:*id_dsa=38;5;192;3:*id_ecdsa=38;5;192;3:*id_ed25519=38;5;192;3:*id_rsa=38;5;192;3:*known_hosts=1:*lock=38;5;248:*lockfile=38;5;248:*pm_to_blib=38;5;240:*rc=38;5;213:*.1p=38;5;7:*.32x=38;5;213:*.3g2=38;5;115:*.3ga=38;5;137;1:*.3gp=38;5;115:*.3p=38;5;7:*.82p=38;5;121:*.83p=38;5;121:*.8eu=38;5;121:*.8xe=38;5;121:*.8xp=38;5;121:*.A64=38;5;213:*.BAT=38;5;172:*.BUP=38;5;241:*.C=38;5;81:*.CFUserTextEncoding=38;5;239:*.DS_Store=38;5;239:*.F=38;5;81:*.F03=38;5;81:*.F08=38;5;81:*.F90=38;5;81:*.F95=38;5;81:*.H=38;5;110:*.IFO=38;5;114:*.JPG=38;5;97:*.M=38;5;110:*.MOV=38;5;114:*.PDF=38;5;141:*.PFA=38;5;66:*.PL=38;5;160:*.R=38;5;49:*.RData=38;5;178:*.Rproj=38;5;11:*.S=38;5;110:*.S3M=38;5;137;1:*.SKIP=38;5;244:*.TIFF=38;5;97:*.VOB=38;5;115;1:*.a00=38;5;213:*.a52=38;5;213:*.a64=38;5;213:*.a78=38;5;213:*.aac=38;5;105;1:*.accdb=38;5;60:*.accde=38;5;60:*.accdr=38;5;60:*.accdt=38;5;60:*.adf=38;5;213:*.adoc=38;5;184:*.afm=38;5;66:*.agda=38;5;81:*.agdai=38;5;110:*.ahk=38;5;41:*.ai=38;5;99:*.aiff=38;5;136;1:*.alac=38;5;136;1:*.allow=38;5;112:*.am=38;5;242:*.amr=38;5;137;1:*.ape=38;5;136;1:*.apk=38;5;215:*.application=38;5;116:*.aria2=38;5;241:*.asc=38;5;184:*.asciidoc=38;5;184:*.asf=38;5;115:*.asm=38;5;81:*.ass=38;5;117:*.atr=38;5;213:*.au=38;5;137;1:*.automount=38;5;45:*.avi=38;5;114:*.awk=38;5;172:*.bad=38;5;242:*.bak=38;5;94:*.bash=38;5;202:*.bash_login=38;5;202:*.bash_logout=38;5;202:*.bash_profile=38;5;202:*.bashrc=38;5;202:*.bat=38;5;208;1:*.bfe=38;5;192;3:*.bib=38;5;178:*.bin=38;5;124:*.bmp=38;5;97:*.bsp=38;5;215:*.c=38;5;81:*.c++=38;5;81:*.ca-bundle=38;5;33;4:*.cab=38;5;215:*.caf=38;5;137;1:*.cap=38;5;29:*.car=38;5;57:*.cbr=38;5;141:*.cbz=38;5;141:*.cc=38;5;81:*.cda=38;5;136;1:*.cdi=38;5;213:*.cdr=38;5;97:*.cert=38;5;191;3:*.cer=38;5;191;3:*.chm=38;5;141:*.cl=38;5;81:*.clj=38;5;41:*.cljc=38;5;41:*.cljs=38;5;41:*.cljw=38;5;41:*.cnc=38;5;7:*.coffee=38;5;074;1:*.com=38;5;208;1:*.cp=38;5;81:*.cpp=38;5;81:*.cr=38;5;81:*.crl=38;5;124;4:*.crt=38;5;191;3:*.crx=38;5;215:*.cs=38;5;81:*.css=38;5;125;1:*.csr=38;5;190;1:*.csv=38;5;78:*.ctp=38;5;81:*.cue=38;5;116:*.cxx=38;5;81:*.dart=38;5;51:*.dat=38;5;137;1:*.db=38;5;177:*.deb=38;5;215:*.def=38;5;7:*.deny=38;5;196:*.der=38;5;30;3:*.description=38;5;116:*.device=38;5;45:*.dhall=38;5;178:*.dicom=38;5;97:*.diff=48;5;197;38;5;232:*.directory=38;5;116:*.divx=38;5;114:*.djvu=38;5;141:*.dll=38;5;241:*.dmg=38;5;215:*.dmp=38;5;29:*.doc=38;5;111:*.dockerignore=38;5;240:*.docm=38;5;111;4:*.docx=38;5;111:*.drw=38;5;99:*.dtd=38;5;178:*.dts=38;5;137;1:*.dump=38;5;241:*.dwg=38;5;216:*.dylib=38;5;241:*.ear=38;5;215:*.el=38;5;81:*.elc=38;5;241:*.eln=38;5;241:*.eml=38;5;125;1:*.enc=38;5;192;3:*.entitlements=1:*.epf=1:*.eps=38;5;99:*.epsf=38;5;99:*.epub=38;5;141:*.err=38;5;160;1:*.error=38;5;160;1:*.etx=38;5;184:*.ex=38;5;7:*.example=38;5;7:*.exe=38;5;208;1:*.f=38;5;81:*.f03=38;5;81:*.f08=38;5;81:*.f4v=38;5;115:*.f90=38;5;81:*.f95=38;5;81:*.fcm=38;5;137;1:*.feature=38;5;7:*.flac=38;5;136;1:*.flif=38;5;97:*.flv=38;5;115:*.fm2=38;5;213:*.fmp12=38;5;60:*.fnt=38;5;66:*.fon=38;5;66:*.for=38;5;81:*.fp7=38;5;60:*.ftn=38;5;81:*.fvd=38;5;124:*.fxml=38;5;178:*.gb=38;5;213:*.gba=38;5;213:*.gbc=38;5;213:*.gbr=38;5;7:*.gel=38;5;213:*.gemspec=38;5;41:*.ger=38;5;7:*.gg=38;5;213:*.ggl=38;5;213:*.gif=38;5;81:*.git=38;5;197:*.gitattributes=38;5;240:*.gitignore=38;5;240:*.gitmodules=38;5;240:*.go=38;5;81:*.gp3=38;5;115:*.gp4=38;5;115:*.gpg=38;5;192;3:*.gpx=38;5;204:*.gs=38;5;81:*.h=38;5;110:*.h++=38;5;110:*.hi=38;5;110:*.hidden-color-scheme=1:*.hidden-tmTheme=1:*.hin=38;5;242:*.hpp=38;5;110:*.hs=38;5;81:*.htm=38;5;125;1:*.html=38;5;125;1:*.hxx=38;5;110:*.icns=38;5;97:*.ico=38;5;97:*.ics=38;5;7:*.ii=38;5;110:*.img=38;5;124:*.iml=38;5;166:*.in=38;5;242:*.info=38;5;184:*.ini=38;5;213:*.ipa=38;5;215:*.ipk=38;5;213:*.ipynb=38;5;41:*.iso=38;5;124:*.j64=38;5;213:*.jad=38;5;215:*.jar=38;5;215:*.java=38;5;074;1:*.jhtm=38;5;125;1:*.jks=38;5;30;3;4;1:*.jpeg=38;5;81:*.jpg=38;5;81:*.js=38;5;074;1:*.jsm=38;5;074;1:*.json=38;5;168:*.jsonl=38;5;168:*.jsonnet=38;5;168:*.jsp=38;5;074;1:*.jxl=38;5;97:*.keystore=38;5;30;3;4;1:*.kml=38;5;202:*.kmz=38;5;203:*.kak=38;5;172:*.key=38;5;191;3;4:*.pub=38;5;193:*.secrets=38;5;192;3:*.lagda=38;5;81:*.lagda.md=38;5;81:*.lagda.rst=38;5;81:*.lagda.tex=38;5;81:*.last-run=1:*.less=38;5;125;1:*.lhs=38;5;81:*.libsonnet=38;5;142:*.lisp=38;5;81:*.lnk=38;5;39:*.localized=38;5;239:*.localstorage=38;5;177:*.log=38;5;201:*.lua=38;5;81:*.m=38;5;110:*.m2v=38;5;114:*.m3u=38;5;116:*.m3u8=38;5;116:*.m4=38;5;242:*.m4a=38;5;137;1:*.m4v=38;5;114:*.map=38;5;7:*.markdown=38;5;183;1:*.md=38;5;183;1:*.md5=38;5;116:*.mdb=38;5;177:*.mde=38;5;60:*.mdump=38;5;241:*.merged-ca-bundle=1:*.mf=38;5;7:*.mfasl=38;5;7:*.mht=38;5;125;1:*.mi=38;5;7:*.mid=38;5;136;1:*.midi=38;5;136;1:*.mjs=38;5;074;1:*.mkd=38;5;184:*.mkv=38;5;213;1:*.mm=38;5;7:*.mobi=38;5;141:*.mod=38;5;137;1:*.moon=38;5;81:*.mount=38;5;45:*.mov=38;5;183;1:*.mp3=38;5;140;1:*.mp4=38;5;114;1:*.mp4a=38;5;137:*.mpeg=38;5;114:*.mpg=38;5;114:*.msg=38;5;178:*.msi=38;5;208:*.msql=38;5;222:*.mtx=38;5;7:*.mustache=38;5;125;1:*.mysql=38;5;222:*.nc=38;5;60:*.ndjson=38;5;168:*.nds=38;5;213:*.nes=38;5;213:*.new=38;5;193;1:*.nfo=38;5;183;1:*.nib=38;5;57:*.nim=38;5;81:*.nimble=38;5;81:*.nix=38;5;155:*.nrg=38;5;124:*.nth=38;5;97:*.numbers=38;5;112:*.o=38;5;241:*.odb=38;5;177:*.odp=38;5;166:*.ods=38;5;112:*.odt=38;5;111:*.oga=38;5;137;1:*.ogg=38;5;137;1:*.ogm=38;5;114:*.ogv=38;5;115:*.old=38;5;94:*.opus=38;5;137;1:*.org=38;5;184:*.orig=38;5;94:*.prev=38;5;94:*.otf=38;5;66:*.out=38;5;242:*.p7c=38;5;30;3;4;1:*.p7s=38;5;30;3;4;1:*.pacnew=38;5;33:*.pages=38;5;111:*.pak=38;5;215:*.part=38;5;239:*.patch=48;5;197;38;5;232;1:*.path=38;5;45:*.pbxproj=1:*.pc=38;5;7:*.pcap=38;5;29:*.pcb=38;5;7:*.pcf=1:*.pcm=38;5;136;1:*.pdf=38;5;141:*.pem=38;5;191;3:*.pfa=38;5;66:*.pfb=38;5;66:*.pfm=38;5;66:*.pgn=38;5;178:*.pgp=38;5;192;3:*.pgsql=38;5;222:*.psql=38;5;222:*.php=38;5;81:*.pi=38;5;7:*.pid=38;5;248:*.p12=38;5;30;3;4;1:*.p7b=38;5;30;3;4;1:*.pk3=38;5;215:*.pkg=38;5;200:*.pfx=38;5;30;3;4:*.pkcs12=38;5;30;3;4;1:*.pl=38;5;208:*.plist=1:*.plt=38;5;7:*.ply=38;5;216:*.pm=38;5;203:*.png=38;5;81:*.pod=38;5;184:*.pot=38;5;7:*.pps=38;5;166:*.ppt=38;5;166:*.ppts=38;5;166:*.pptsm=38;5;166;4:*.pptx=38;5;166:*.pptxm=38;5;166;4:*.profile=38;5;202:*.properties=38;5;116:*.ps=38;5;99:*.psd=38;5;97:*.psf=1:*.pxd=38;5;97:*.pxm=38;5;97:*.py=38;5;41:*.pyc=38;5;240:*.qcow=38;5;124:*.r=38;5;49:*.r[0-9]{0,2}=38;5;239:*.rake=38;5;155:*.rb=38;5;163;3;1:*.rdata=38;5;178:*.rdf=38;5;7:*.rkt=38;5;81:*.rlib=38;5;241:*.rmvb=38;5;114:*.rnc=38;5;178:*.rng=38;5;178:*.rom=38;5;213:*.rpm=38;5;215:*.rs=38;5;81:*.rss=38;5;178:*.rst=38;5;184:*.rstheme=1:*.rtf=38;5;111:*.ru=38;5;7:*.s=38;5;110:*.s3m=38;5;137;1:*.sample=38;5;114:*.sass=38;5;125;1:*.sassc=38;5;244:*.sav=38;5;213:*.sc=38;5;41:*.scala=38;5;41:*.scan=38;5;242:*.sch=38;5;7:*.scm=38;5;7:*.scpt=38;5;219:*.scss=38;5;125;1:*.sed=38;5;172:*.service=38;5;45:*.sfv=38;5;116:*.sgml=38;5;178:*.sh=38;5;34:*.sid=38;5;137;1:*.sig=38;5;192;3:*.signature=38;5;192;3:*.sis=38;5;7:*.sms=38;5;213:*.snapshot=38;5;45:*.socket=38;5;45:*.sparseimage=38;5;124:*.spl=38;5;7:*.sql=38;5;222:*.sqlite=38;5;177:*.wal=38.5.117:*.srt=38;5;117:*.ssa=38;5;117:*.st=38;5;213:*.stackdump=38;5;241:*.state=38;5;248:*.stderr=38;5;160;1:*.stl=38;5;216:*.storyboard=38;5;196:*.strings=1:*.sty=38;5;7:*.sub=38;5;117:*.sublime-build=1:*.sublime-commands=1:*.sublime-keymap=1:*.sublime-project=1:*.sublime-settings=1:*.sublime-snippet=1:*.sublime-workspace=1:*.sug=38;5;7:*.sup=38;5;117:*.svg=38;5;99:*.swap=38;5;45:*.swift=38;5;219:*.swo=38;5;244:*.swp=38;5;244:*.sx=38;5;81:*.t=38;5;114:*.target=38;5;45:*.tcc=38;5;110:*.tcl=38;5;64;1:*.tdy=38;5;7:*.tex=38;5;184:*.textile=38;5;184:*.tf=38;5;168:*.tfm=38;5;7:*.tfnt=38;5;7:*.tfstate=38;5;168:*.tfvars=38;5;168:*.tg=38;5;7:*.theme=38;5;116:*.tif=38;5;97:*.tiff=38;5;97:*.timer=38;5;45:*.tmTheme=1:*.tmp=38;5;244:*.toast=38;5;124:*.toml=38;5;168:*.torrent=38;5;116:*.ts=38;5;115:*.tsv=38;5;78:*.ttf=38;5;66:*.twig=38;5;81:*.txt=38;5;228:*.typelib=38;5;60:*.un~=38;5;241:*.urlview=38;5;116:*.user-ca-bundle=1:*.v=38;5;81:*.vala=38;5;81:*.vapi=38;5;81:*.vb=38;5;81:*.vba=38;5;81:*.vbs=38;5;81:*.vcard=38;5;7:*.vcd=38;5;124:*.vcf=38;5;7:*.vdf=38;5;215:*.vdi=38;5;124:*.vfd=38;5;124:*.vhd=38;5;124:*.vhdx=38;5;124:*.vim=38;5;172:*.viminfo=1:*.vmdk=38;5;124:*.vob=38;5;115;1:*.vpk=38;5;215:*.vtt=38;5;117:*.war=38;5;215:*.wav=38;5;153;1:*.webloc=38;5;116:*.webm=38;5;115:*.webp=38;5;97:*.wma=38;5;137;1:*.wmv=38;5;114:*.woff=38;5;66:*.woff2=38;5;66:*.wrl=38;5;216:*.wv=38;5;136;1:*.wvc=38;5;136;1:*.xcconfig=38;5;213:*.xcf=38;5;7:*.xcsettings=1:*.xcuserstate=1:*.xcworkspacedata=1:*.xib=38;5;208:*.xla=38;5;76:*.xln=38;5;7:*.xls=38;5;112:*.xlsx=38;5;112:*.xlsxm=38;5;112;4:*.xltm=38;5;73;4:*.xltx=38;5;73:*.xml=38;5;168:*.xpi=38;5;215:*.xpm=38;5;97:*.xsd=38;5;178:*.xsh=38;5;41:*.yaml=38;5;168:*.yml=38;5;168:*.z[0-9]{0,2}=38;5;239:*.zcompdump=38;5;241:*.zig=38;5;81:*.zlogin=1:*.zlogout=1:*.zprofile=1:*.zsh=38;5;172:*.zshenv=1:*.zwc=38;5;241:*.zx[0-9]{0,2}=38;5;239:bd=38;5;68:ca=38;5;17:cd=38;5;113;1:di=38;5;33:do=38;5;127:ex=38;5;118;1:pi=38;5;126:fi=0:ln=38;5;50;4;1:mh=38;5;222;1:no=0:or=48;5;196;38;5;232;1:ow=38;5;220;1:sg=48;5;3;38;5;0:su=38;5;220;1;3;100;1:so=38;5;197:st=38;5;86;48;5;234:tw=48;5;235;38;5;139;3:'


export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"


#export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
#export XDG_RUNTIME_DIR="$XDG_CACHE_HOME/runtime"

export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_VIDEOS_DIR="$HOME/Videos"
export XDG_PUBLICSHARE_DIR="$HOME/Public"

export XCOMPOSEFILE="$XDG_CONFIG_HOME/X11/xcompose"
export XCOMPOSECACHE="$XDG_CACHE_HOME/X11/xcompose"


export NIX_STATE_HOME_DIR="$XDG_STATE_HOME/nix"
export NIX_CONFIG="experimental-features = nix-command flakes"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export LESSHISTFILE="$XDG_CACHE_HOME/less/lesshst"
export HISTFILE="$XDG_STATE_HOME/bash/history"

export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"

export DOOMDIR="$XDG_CONFIG_HOME/doom"

export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME/jupyter"
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python"
export PYTHONUSERBASE="$XDG_DATA_HOME/python"


export NPM_CONFIG_PREFIX="${XDG_DATA_HOME}/npm"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"

export STACK_XDG=1
export STACK_ROOT="$XDG_DATA_HOME/stack"

export XMONAD_CONFIG_HOME="$XDG_CONFIG_HOME/xmonad"
export XMONAD_DATA_HOME="$XDG_DATA_HOME/xmonad"
export XMONAD_CACHE_HOME="$XDG_CACHE_HOME/xmonad"

export GOPATH="$XDG_DATA_HOME/go"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"

export AZURE_CONFIG_DIR="$XDG_DATA_HOME/azure"

export GNUPGHOME="$XDG_DATA_HOME/gnupg"

export HISTFILE="$XDG_STATE_HOME/bash/history"

export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

export CONDARC="$XDG_CONFIG_HOME/conda/condarc"

export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"

export DISCORD_USER_DATA_DIR="${XDG_DATA_HOME}"

export VIMINIT='let $MYVIMRC = !has("nvim") ? "~/.config/vim/init.vim" : "~/.config/nvim/init.lua" | so $MYVIMRC'

export PYENV_ROOT="$XDG_DATA_HOME/pyenv"

#export USERXSESSION="$XDG_CACHE_HOME/X11/xsession"
#export USERXSESSIONRC="$XDG_CACHE_HOME/X11/xsessionrc"
#export ALTUSERXSESSION="$XDG_CACHE_HOME/X11/Xsession"


export XINITRC="$XDG_CONFIG_HOME/X11/xinitrc"
export XSERVERRC="$XDG_CACHE_HOME/X11/xserverrc"


export XCOMPOSEFILE="$XDG_CONFIG_HOME/X11/xcompose"
export XCOMPOSECACHE="$XDG_CACHE_HOME/X11/xcompose"

export KERAS_HOME="$XDG_CONFIG_HOME/keras"


alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias wget='wget --hsts-file="$XDG_CACHE_HOME/wget-hsts"'


export MAIL="thunderbird"
#export WINDOW_MANAGER="xmonad"
#export BROWSER="something"
export EDITOR="vim"
#export TERM="alacritty"
export PAGER="less"



exp_file_contents() {
    FILE=$1
    if [ -f $FILE ];
    then
        set -a
        source $FILE
        set +a
    else
        echo "error sourcing files from $FILE"
    fi
}


check_source_file() {
    if [ -f "$1" ];
    then
        . "$1";
    else
        echo "Error $1";
    fi
}

touch_x() {
    touch $1 \
        && sudo chmod u+x $1
}

mkdir_cd() {
    mkdir -p $1 \
        && cd $1
}


mkdir_if_not_exists() {
    ! [ -d $1 ] \
        && mkdir -p $1
}


touch_if_not_exists() {
    ! [ -f "$1" ] \
        && mkdir -p $(dirname $1) \
        && touch $1
}


add_path() {
    export PATH="$PATH:$1"
}


export_subfolder_rec() {

  PATH_LIST=$(find "$1" -type d -printf ':%p')

  add_path "${PATH_LIST:1}"
}


commit() {
    if [ $# -ge 1 ]
    then
        git status &&\
            git add . &&\
            git commit -m "$1" &&\
            git push --all origin
    else
        echo "ERROR"
    fi
}


check_source_file $HOME/.config/profile/vars.sh



add_path $HOME/.local/bin
add_path $HOME/.local/share/python/bin
add_path $HOME/.config/emacs/bin



export_subfolder_rec $HOME/.config/.FILES/scripts/.config/scripts/


alias gst="git status"
alias gp="git push"
alias siu="sudo"
alias sd="sudo shutdown now"
alias rb="reboot"
alias tf="terraform"
alias py="python3"
alias :q="exit"
alias new_shell="clear && $SHELL && exit"


touch_if_not_exists $HISTFILE
# touch_if_not_exists $XSERVERRC
mkdir_if_not_exists $XDG_DESKTOP_DIR
mkdir_if_not_exists $XDG_DOCUMENTS_DIR
mkdir_if_not_exists $XDG_DOWNLOAD_DIR
mkdir_if_not_exists $XDG_MUSIC_DIR
mkdir_if_not_exists $XDG_PICTURES_DIR
mkdir_if_not_exists $XDG_TEMPLATES_DIR
mkdir_if_not_exists $XDG_VIDEOS_DIR
mkdir_if_not_exists $XDG_PUBLICSHARE_DIR



touch_if_not_exists   $HOME/.config/tmp_env.sh
check_source_file     $HOME/.config/tmp_env.sh




[ -z "$PS1" ] && return

[[ $- != *i* ]] && return


HISTCONTROL=ignoredups:ignorespace
HISTSIZE=
HISTFILESIZE=

export HISTIGNORE="ls:cd:cd -:pwd:exit:date:reboot"


shopt -s histappend
shopt -s dotglob
shopt -s nocaseglob
shopt -s cdspell
shopt -s checkwinsize

set completion-ignore-case on
set -o vi
set editing-mode vi
set keymap vi

set show-all-if-ambiguous on
set mark-symlinked-directories on
set colored-stats on


# . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"


# set environment variables properly, for all utilities
# fix git commit script
# add script to initialise config on multiple distros
# create shell script to check if program is installed
# add script to search in the web from the terminal
# add text file to list all paths folders to be added
# adding extract file function
# echo "add move windows in vim and emacs"
# echo "convention vim, nvim and emacs keybidings"



export PATH=$HOME/.config/emacs/bin:$PATH

