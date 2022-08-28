

config.load_autoconfig(False)



c.url.start_pages = [
    "https://searx.org/searchs",
    "https://www.qutebrowser.org/doc/help/configuring.html#configpy"
]

c.url.default_page="https://searx.org/searchs"

config.bind(",c", "config-edit")
config.bind(",r", "restart")



c.url.searchengines = {
    "DEFAULT": "https://searx.xyz/search?q={}",
    "yt": "https://yewtu.be/results?search_query={}"
}



c.editor.command = ["alacritty", "-e", "vim", "{}"]
