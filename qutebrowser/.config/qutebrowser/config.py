searx_instance="https://searx.fmac.xyz"
invidious_instance="https://y.com.sb"


config.load_autoconfig(False)


c.url.start_pages = [
    searx_instance
]


c.url.default_page=searx_instance
#c.content.proxy="socks://localhost:9050/"

config.bind(",c", "config-edit")
config.bind(",r", "restart")
config.bind(",o", "open -t")
config.bind(",q", "q")
config.bind(",v", "spawn mpv {url}")
config.bind(",s", "session-save ")


c.url.searchengines = {
    "DEFAULT": searx_instance + "/search?q={}",
    "yt": invidious_instance + "/results?search_query={}",
    "wa": "https://wiki.archlinux.org/index.php?search={}",
    "gg": "https://google.com/search?q={}",
    "gh": "https://github.com/search?q={}",
    "pypip": "https://pypi.org/search/?q={}",
}



c.editor.command = ["st", "-e", "vim", "{}"]
