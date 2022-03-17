import os
import subprocess

from typing import List
from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

from settings.keys import mod, keys
# from settings.groups import group_names

colors = [["#282C34"],  # 0 panel background
          ["#3d3f4b"],  # 1 background for current screen tab
          ["#ffffff"],  # 2 font color for group names (White)
          ["#FF7171"],  # 3 border line color for current tab
          ["#74438f"],  # 4 border line color for 'other tabs' and color for 'odd widgets'
          ["#6886C5"],  # 5 color for the 'even widgets'
          ["#ff5131"],  # 6 window name
          ["#92967D"],  # 7 foreground for inactive screens
          ["#32E0C4"],  # 8 Mint
          ["#DDDDDD"],  # 9 white variant
          ["#3DB2FF"],  # 10 Blue arch linux
          ["#FF4848"],  # 11 Red
          ["#F0A500"]]  # 12 Orange

# One dark colors
one_dark = [["#282C34"],  # 0 black
            ["#E06c75"],  # 1 red
            ["#98C379"],  # 2 green
            ["#E5C07B"],  # 3 yellow
            ["#61AFEF"],  # 4 blue
            ["#C678DD"],  # 5 magenta
            ["#56B6C2"],  # 6 cyan
            ["#ABB2BF"]]  # 7 white

group_names = [
    ("", {
        'layout': 'monadtall',
        'matches': [Match(wm_class=('firefox',))],
    }),
    ("", {'layout': 'monadtall'}),
    ("", {'layout': 'monadtall'}),
    ("", {'layout': 'monadtall'}),
    ("", {'layout': 'monadtall'}),
    ("", {'layout': 'monadtall'}),
    ("", {
        'layout': 'monadtall',
        'matches': [Match(wm_class=('Thunderbird',))],
    }),
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

layouts = [
    layout.MonadTall(border_focus=one_dark[1], border_width=1, margin=10),
    layout.MonadWide(bborder_focus=one_dark[1], order_width=1, margin=10),
    layout.Matrix(border_focus=one_dark[1], order_width=1, margin=10),
    layout.Max(),
    layout.Floating(),
]

widget_defaults = dict(
    font='JetBrains Mono NL:style=Bold',
    fontsize=12,
    padding=8,
    background=one_dark[0],
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    text="",
                    padding_x=6,
                    fontsize=34,
                    background=colors[9],
                    foreground=colors[10],
                ),
                widget.TextBox(
                    text="\uE0B0",
                    fontsize=22,
                    padding=0,
                    background=one_dark[0],
                    foreground=colors[9],
                ),
                widget.Sep(
                    linewidth=0,
                    foreground=colors[2],
                    background=colors[0]
                ),
                widget.GroupBox(
                    fontsize=23,
                    margin_y=3,
                    margin_x=0,
                    padding_y=6,
                    padding_x=6,
                    borderwidth=3,
                    active=colors[2],
                    inactive=colors[7],
                    rounded=False,
                    highlight_color=colors[1],
                    highlight_method="line",
                    # this_current_screen_border=colors[6],#line
                    this_current_screen_border=colors[8],  # line
                    this_screen_border=colors[4],
                    other_current_screen_border=colors[6],
                    other_screen_border=colors[4],
                    foreground=colors[2],
                    background=colors[0]
                ),
                widget.Sep(
                    linewidth=0,
                    foreground=colors[2],
                    background=colors[0]
                ),
                widget.TextBox(
                    text="\uE0B0",
                    fontsize=22,
                    padding=0,
                    foreground=one_dark[0],
                    background="325288",
                ),
                widget.WindowName(
                    font="MesloLGS NF:style=Bold",
                    fontsize=14,
                    padding_x=1,
                    # foreground=one_dark[0],
                    foreground=colors[2],
                    background="325288",
                    # background=colors[8],
                ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox(
                    text="\uE0B2",
                    fontsize=22,
                    padding=0,
                    foreground=one_dark[0],
                    background="325288",
                ),
                widget.Systray(),
                widget.Sep(
                    linewidth=0,
                    padding=8,
                    foreground=colors[2],
                    background=colors[0]
                ),
                widget.TextBox(
                    text="\uE0B2",
                    fontsize=22,
                    foreground=colors[10],
                    padding=0
                ),
                widget.TextBox(
                    text="",
                    fontsize=20,
                    foreground=colors[2],
                    background=colors[10],
                    padding=0
                ),
                widget.Volume(
                    foreground=colors[2],
                    background=colors[10],
                    fontsize=13,
                    step=5,
                    channel='Master',
                ),
                widget.TextBox(
                    text="\uE0B2",
                    fontsize=22,
                    foreground=colors[2],
                    background=colors[10],
                    padding=0
                ),
                widget.TextBox(
                    text="",
                    fontsize=15,
                    foreground=colors[2],
                    padding=0
                ),
                widget.Volume(
                    foreground=colors[2],
                    fontsize=13,
                    step=5,
                    channel='Capture',
                ),
                widget.TextBox(
                    text="\uE0B2",
                    fontsize=22,
                    foreground=colors[2],
                    padding=0
                ),
                widget.Clock(
                    foreground=colors[2],
                    fontsize=14,
                    format='%a %d %b %I:%M %p',
                ),
                widget.TextBox(
                    text="\uE0B2",
                    fontsize=22,
                    padding=0,
                    foreground=colors[9],
                ),
                widget.CurrentLayout(
                    background=colors[9],
                    fontsize=14,
                    foreground=colors[10],
                    padding_x=1,
                ),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(wm_class='Pavucontrol'),  # volume control
    Match(wm_class='PacketTracer'),
    Match(wm_class='sxiv'),
    Match(wm_class='xdman-Main'),
    Match(wm_class='Lxappearance'),
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True

wmname = "LG3D"


@ hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
