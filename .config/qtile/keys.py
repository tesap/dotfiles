from libqtile.command import lazy
from libqtile.config import Key

def default_keys(mod='mod4', alt='mod1'):
    keys = [
        Key([mod], "Tab", lazy.next_layout()),

        Key([mod, "shift"], "c", lazy.window.kill()),
        Key([mod, "shift"], "q", lazy.shutdown()),
        Key([mod, "shift"], "r", 
            lazy.restart(), 
        ),

        Key([mod, "control"], "r", 
            lazy.spawn('./.config/polybar/launch.sh')
        ),

        Key([mod], "k", lazy.layout.previous()),
        Key([mod], "j", lazy.layout.next()), 

        Key([mod], "h",
            lazy.layout.grow(), # (MonadTall)
            lazy.layout.increase_nmaster(), # (Tile)
            lazy.layout.grow_left(), # (Columns)
        ),

        Key([mod], "l",
            lazy.layout.shrink(), # (MonadTall)
            lazy.layout.decrease_nmaster(), # (Tile)
            lazy.layout.grow_right(), # (Columns)
        ),

        Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
        Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
        Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
        Key([mod, "shift"], "l", lazy.layout.shuffle_right()),

        Key([mod], "m", lazy.window.toggle_fullscreen()),

        Key(
            [mod], "space",
            lazy.window.toggle_floating()
        ),

        # Key([mod, "control"], "j", lazy.layout.grow_down()),
        # Key([mod, "control"], "k", lazy.layout.grow_up()),
        # Key([mod], "n", lazy.layout.normalize()),
        # Key([mod], "m", lazy.layout.maximize()),
        # Key([mod, "control"], "Return", lazy.layout.toggle_split()),

        Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
        Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
        Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),
        Key([], "XF86AudioMicMute", lazy.spawn("pactl set-source-mute @DEFAULT_SOURCE@ toggle")),
        Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight -inc 10")),
        Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -dec 10")),
    ]

    return keys
