####################################
# QTILE CONFIG BY ABDOULAYE BALDE#
####################################

# Imports
from typing import List  # noqa: F401
from libqtile import bar, layout, widget, qtile
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import os

# import layout objects
from libqtile.layout.columns import Columns
from libqtile.layout.xmonad import MonadTall
from libqtile.layout.stack import Stack
from libqtile.layout.floating import Floating


# Some quick settings
mod = "mod4"
modLauncher = "mod4"
terminal = "kitty -o background_opacity=0.90"
browser = "brave"

# Keyshortcut
keys = [
    # added above
    Key([], "Print", lazy.spawn("flameshot screen -p /home/balde/Pictures")),
    Key([mod], "b", lazy.spawn("brave"), desc="Launch browser"),
    Key([mod], "d", lazy.spawn("discord"), desc="Launch discord"),
    Key([mod], "o", lazy.spawn("firefox"), desc="Launch firefox"),
    Key([mod], "s", lazy.spawn("flamshot"), desc="Launch flamshot"),
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key(
        [mod],
        "q",
        lazy.spawn("~/.config/qtile/shutdown.sh"),
        desc="Shutdown Qtile",
    ),
    Key(
        [mod],
        "r",
        lazy.spawn('rofi -modi "drun" -show'),
        desc="Spawn a ROFI",
    ),
    Key([mod], "f", lazy.spawn(browser), desc="Spawn browser"),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 -q set Master 1dB-")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -c 0 -q set Master toggle")),
    Key([], "Print", lazy.spawn("flameshot full -p Downloads/")),
    Key([mod], "Print", lazy.spawn("flameshot gui")),
    Key([mod, "shift"], "f", lazy.window.toggle_floating(), desc="toggle floating"),
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="toggle fullscreen"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Audio control
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 5%+")),
    # Brithness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl s +5%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl s 5%-")),
]


grops = {
    1: Group(" "),
    2: Group("I"),
    3: Group("II"),
    4: Group("III"),
    5: Group("IV"),
    6: Group("V"),
}

groups = [grops[i] for i in grops]


def get_key(name):
    return [k for k, g in grops.items() if g.name == name][0]


for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                str(get_key(i.name)),
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                str(get_key(i.name)),
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
            Key(
                [mod, "control"],
                str(get_key(i.name)),
                lazy.window.togroup(i.name, switch_group=False),
                desc="move focused window to group {}".format(i.name),
            ),
        ]
    )

# Colors

background_light = ["#3B4252", "#3B4252"]
background_dark = ["#2E3440", "#2E3440"]
foreground = ["#D8DEE9", "#D8DEE9"]

red = ["#BF616A", "#BF616A"]
green = ["#A3BE8C", "#A3BE8C"]
blue = ["#88c0d0", "#88c0d0"]
yellow = ["#EBCB8B", "#EBCB8B"]
orange = ["#D08770", "#D08770"]
purple = ["#B48EAD", "#B48EAD"]

colors = [
    ["#282c34", "#282c34"],
    ["#1c1f24", "#1c1f24"],
    ["#dfdfdf", "#dfdfdf"],
    ["#ff6c6b", "#ff6c6b"],
    ["#98be65", "#98be65"],
    ["#da8548", "#da8548"],
    ["#51afef", "#51afef"],
    ["#c678dd", "#c678dd"],
    ["#46d9ff", "#46d9ff"],
    ["#a9a1e1", "#a9a1e1"],
]

# Layout theme defines how to place windows in my layout (I only use one layout)
layout_theme = {
    "border_width": 2,
    "margin": 6,
    "border_focus": "e1acff",
    "border_normal": "1D2330",
}
# layouts = [layout.Columns(**layout_theme)]

layouts = [
    layout.Columns(**layout_theme, border_on_single=True, fair=True),
    layout.Max(),
    layout.Floating(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    # layout.MonadTall(),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]


# Bluetooth
def open_bluetooth(qtile):
    qtile.cmd_spawn("blueman-manager")


widget_defaults = dict(
    font="Iosevka Heavy",
    fontsize=15,
    padding=2,
    background=background_dark,
    foreground=foreground,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth=0, padding=6, foreground=colors[2], background=colors[0]
                ),
                widget.GroupBox(
                    this_screen_border=colors[3],
                    this_current_screen_border=purple,
                    rounded=False,
                    highlight_method="line",
                    font="Iosevka Heavy",
                    disable_drag=True,
                    foreground=colors[3],
                    inactive="#797d93",
                    borderwidth=5,
                    highlight_color=["#4b5162", "#4b5162"],
                    urgent_border=colors[3],
                ),
                widget.Prompt(),
                widget.Spacer(),
                widget.Chord(
                    chords_colors={
                        "launch": (colors[5], "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Sep(),
                # WIFI
                widget.TextBox(
                    # font="icons",
                    fontsize=16,
                    text=" ",
                    mouse_callbacks={"Button1": open_bluetooth},
                    padding=8,
                    foreground=colors[5],
                ),
                # Volume
                # widget.Volume(
                #     foreground=colors[3],
                #     fontsize=15,
                # ),
                # Clock
                widget.Sep(),
                widget.Clock(
                    foreground=purple,
                    format="%a %I:%M %p ",
                    fontsize=14,
                    padding=4,
                ),
                widget.Sep(),
                # Battery
                widget.Battery(
                    foreground=purple,
                    fontsize=15,
                    battery=0,
                    charge_char=" ",
                    update_interval=60,
                    discharge_char="",
                    font="Iosevka Heavy",
                    padding=8,
                    format=" {percent:2.0%}",
                    low_percentage=0.3,
                ),
                widget.Sep(),
                widget.Bluetooth(),
                widget.TextBox(
                    fontsize=14,
                    text="",
                    padding=8,
                    foreground=colors[5],
                ),
                widget.Sep(
                    inewidth=0, padding=6, foreground=colors[2], background=colors[0]
                ),
                widget.TextBox(
                    font="icons",
                    text=" ",
                    padding=8,
                    foreground=purple,
                    fontsize=16,
                ),
            ],
            25,
            background=colors[1],
        ),
    ),
]


# added below
widget_defaults = dict(
    font="Iosevka Heavy",
    fontsize=13,
    padding=2,
    forgeground=colors[2],
)


mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
    Click([mod, "shift"], "Button1", lazy.window.disable_floating()),
    Click([mod], "Button1", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    **layout_theme
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

wmname = "LG3D"


autostart = [
    "feh --bg-fill /home/balde/.config/qtile/walp.jpg",
    "picom --no-vsync &",
    "nm-applet &",
]

for x in autostart:
    os.system(x)
