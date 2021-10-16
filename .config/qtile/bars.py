import os, collections
from libqtile.config import Screen
from libqtile.command import lazy
from libqtile import bar, widget

# from utils import compose

class Colors:
    WHITE = "#ffffff"
    BLACK = "#000000"

    DARK_GRAY = "#272a34"
    LIGHT_GRAY = "#606475"
    GRAY = "#434758"

    RED = "#ff5555"
    DARK_RED = "#9d3b3b"


    ACCENT = "#354078"
    TEXT = "#d4e3e7"
    # BG = "#16171A"
    BG = "#0b0b0d"

default_colors = {
    'foreground': Colors.TEXT,
    'background': Colors.BG
}

sep = lambda x: widget.Sep(
    linewidth = 0,
    padding = x,
    **default_colors
)

def arrow(fg=Colors.ACCENT, bg=Colors.BG):
    return widget.TextBox(text='',
           background=bg, foreground=fg,
           padding = 0, 
           fontsize = 37 
           )

a1 = arrow()
a2 = arrow(Colors.BG, Colors.ACCENT)


def wrap_arrows(f):
    def wrapper(*args, **kwargs):
        inner = f(*args, **kwargs)

        if isinstance(inner, collections.Iterable):
            main = inner[0]
        else:
            main = inner
        
        if main.background == Colors.BG:
            s1, s2 = a2, a1
        else:
            s1, s2 = a1, a2

        return s1, *inner, s2

    return wrapper

def get_widgets():

    
    
    
    
    def groups():
        w = widget.GroupBox(
           font = "Ubuntu Bold",
           fontsize=  11,
           margin_y = 3,
           margin_x = 5, 
           padding_y = 5,
           padding_x = 5,
           borderwidth = 2,

           active = Colors.TEXT,
           inactive=Colors.LIGHT_GRAY,
           highlight_color = Colors.DARK_GRAY,

           highlight_method = "line",
           this_current_screen_border = Colors.RED,
           # hide_unused=True,
           **default_colors,
        )
        return [
            sep(10),
            w,
            sep(10),
        ]

    
    
    def layout_widgets():
        bg = Colors.BG
        s = sep(5)

        return [
            s,
            widget.CurrentLayoutIcon(
                custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                padding = 1,
                scale = 0.8,
                **default_colors,
            ),

            widget.CurrentLayout(
                padding = 5,
                **default_colors,
            ),
        ]

    def window_title():
        w = widget.WindowName(**default_colors)
        return [
            sep(20),
            w,
        ]


    graph_settings = {
        'graph_color': Colors.RED,
        # 'fill_color': Colors.DARK_RED,
        'border_width': 0,
        'padding': 10,
        'frequency': 1,
        **default_colors,
    }

    
    
    def cpu_graph():
        w = widget.CPUGraph(**graph_settings)
        return [w, sep(5)]

    
    
    def mem_graph():
        w = widget.MemoryGraph(**graph_settings)
        return [w]
    
    
    
    def net_graph():
        w = widget.NetGraph(**graph_settings)
        return [w, sep(5)]

    def systray():
        w = widget.Systray()
        return [w]

    widgets_list = [
        sep(8),

        *groups(),
        *layout_widgets(),
        *window_title(),
        *cpu_graph(),
        *net_graph(),
        
        # *systray(),
        sep(20),

        ]

    return widgets_list 


def get_screens():
    return [Screen(top=bar.Bar(widgets=get_widgets(), opacity=1.0, size=20))]
