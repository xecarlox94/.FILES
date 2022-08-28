searx_instance="https://searxng.tordenskjold.de"
invidious_instance="https://yewtu.be"


config.load_autoconfig(False)


c.url.start_pages = [
    searx_instance,
    "https://www.qutebrowser.org/doc/help/configuring.html#configpy"
]


c.url.default_page=searx_instance


config.bind(",c", "config-edit")
config.bind(",r", "restart")
config.bind(",s", "open -t")



c.url.searchengines = {
    "DEFAULT": searx_instance + "/search?q={}",
    "yt": invidious_instance + "/results?search_query={}"
}



c.editor.command = ["alacritty", "-e", "vim", "{}"]
