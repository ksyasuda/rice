import dracula.draw

# Load existing settings made via :set
config.load_autoconfig(True)

config.set("colors.webpage.darkmode.enabled", True)

c.content.blocking.method = "both"
c.content.default_encoding = "utf-8"
c.content.pdfjs = True  # display pdfs
c.zoom.default = "125%"

# c.url.default_page = "https://dash.suda.codes"
c.url.start_pages = ["https://dash.suda.codes", "https://links.suda.codes"]
c.editor.command = ["kitty", "-e", "nvim", "{}"]
c.url.searchengines["a"] = "https://wiki.archlinux.org/?search={}"
c.url.searchengines["ap"] = "https://www.archlinux.org/packages/?sort=&q={}"
c.url.searchengines["aur"] = "https://aur.archlinux.org/packages/?K={}"
c.url.searchengines["r"] = "https://www.reddit.com/r/{}"
c.url.searchengines["p"] = "https://docs.python.org/3/library/{}"
c.url.searchengines["yt"] = "https://www.youtube.com/results?search_query={}"
c.url.searchengines["ytc"] = "https://www.youtube.com/c/{}"

c.aliases["gd"] = "open -t http://192.168.4.77:4000"


config.bind(
    "<Ctrl-Shift-m>",
    "hint links spawn --detach mpv {hint-url}",
)

config.bind(
    "M",
    "hint links spawn --detach mpv {hint-url}",
)

config.bind("Y", "hint links spawn kitty -e youtube-dlp {hint-url}")
config.bind(
    "<Ctrl-Shift-d>",
    "hint links spawn --detach kitty -e yt-dlp {hint-url}",
)

config.bind("<Ctrl-=>'", "zoom-in")
config.bind("<Ctrl+->'", "zoom-out")

config.bind("<j>", "scroll-px 0 150")

config.bind("<k>", "scroll-px 0 -150")

config.bind("ts", "config-cycle statusbar.show always never")
config.bind("tt", "config-cycle tabs.show always never")


dracula.draw.blood(c, {"spacing": {"vertical": 6, "horizontal": 8}})
