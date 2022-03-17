import os
import subprocess

from libqtile import layout, hook, widget, bar
from libqtile.config import Click, Drag, Key, Screen, Match
from libqtile.lazy import lazy

from settings.keys import mod, keys
from settings.colors import colors, one_dark
from settings.groups import groups, group_names

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
