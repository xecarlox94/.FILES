searx_instance="https://search.demoniak.ch"
invidious_instance="https://y.com.sb"
#proxy_url="socks://localhost:9050/"

leader_key = ','

terminal = "alacritty"
editor = "nvim"

config_edit_cmd = lambda t, e: f"{t} -e {e}" + " {}"


key_bindings = [
    ("c", "config-edit"),
    ("r", "restart"),
    ("o", "open -t"),
    ("q", "q"),
    ("v", "spawn mpv {url}"),
    ("s", "session-save ")
]

search_engines = {
    "DEFAULT": searx_instance + "/search?q={}",
    "yt": invidious_instance + "/search?q={}",
    "wa": "https://wiki.archlinux.org/index.php?search={}",
    "gg": "https://google.com/search?q={}",
    "git": "https://github.com/search?q={}",
    "pip": "https://pypi.org/search/?q={}",
    "hs": "https://hoogle.haskell.org/?hoogle={}",
    "nix": "https://search.nixos.org/packages?query={}",
    "dckh": "https://hub.docker.com/search?q={}"
}

settings = [
    ('content.cookies.store', False)
]






key_bindings = list(map(
    lambda k_c: (
        leader_key + k_c[0],
        k_c[1]
    ),
    key_bindings
))


for k, b in key_bindings:
    config.bind(k, b)


for s, v in settings:
    config.set(s, v)


c.url.searchengines = search_engines
c.url.default_page  = searx_instance
c.url.start_pages   = [searx_instance]


try:
    c.content.proxy = proxy_url
except:
    pass


c.editor.command = (
    config_edit_cmd(
        terminal,
        editor
    )
    .split(' ')
)


config.load_autoconfig(False)

