import os
import subprocess

from typing import List  # noqa: F401

from libqtile import bar, layout, widget, hook
from libqtile.config import Click, Drag, Group, EzKey, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

mod = "mod4"
#terminal = guess_terminal()
terminal = "urxvt"

# modifier_keys = {
#   'M': 'mod4',
#   'A': 'mod1',
#   'S': 'shift',
#   'C': 'control',
# }

keys = [
    # Switch between windows
    EzKey("M-h", lazy.layout.left(), desc="Move focus to left"),
    EzKey("M-l", lazy.layout.right(), desc="Move focus to right"),
    EzKey("M-j", lazy.layout.down(), desc="Move focus down"),
    EzKey("M-k", lazy.layout.up(), desc="Move focus up"),
    EzKey("M-<space>", lazy.layout.next(),
          desc="Move window focus to other window"),

    # Switch between groups
    EzKey("M-S-n", lazy.screen.next_group(),
          desc="Move to the group on the right"),
    EzKey("M-S-p", lazy.screen.prev_group(),
          desc="Move to the group on the left"),
    EzKey("M-<Tab>", lazy.screen.toggle_group(),
          desc="Move to the last visited group"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    EzKey("M-S-h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    EzKey("M-S-l", lazy.layout.shuffle_right(),
          desc="Move window to the right"),
    EzKey("M-S-j", lazy.layout.shuffle_down(), desc="Move window down"),
    EzKey("M-S-k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    EzKey("M-C-h", lazy.layout.grow_left(), desc="Grow window to the left"),
    EzKey("M-C-l", lazy.layout.grow_right(), desc="Grow window to the right"),
    EzKey("M-C-j", lazy.layout.grow_down(), desc="Grow window down"),
    EzKey("M-C-k", lazy.layout.grow_up(), desc="Grow window up"),
    EzKey("M-n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    EzKey("M-S-<Return>", lazy.layout.toggle_split(),
          desc="Toggle between split and unsplit sides of stack"),
    EzKey("M-<Return>", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    EzKey("M-S-<Tab>", lazy.next_layout(), desc="Toggle between layouts"),
    EzKey("M-w", lazy.window.kill(), desc="Kill focused window"),
    EzKey("M-f", lazy.window.toggle_fullscreen(),
          desc="Put the focused window to/from fullscreen mode"),
    EzKey("M-S-f", lazy.window.toggle_floating(),
          desc="Put the focused window to/from floating mode"),

    EzKey("M-C-r", lazy.restart(), desc="Restart Qtile"),
    EzKey("M-C-q", lazy.shutdown(), desc="Shutdown Qtile"),
    EzKey("M-r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),

    # Hotkeys
    EzKey("M-d", lazy.spawn("rofi -show drun -show-icons -icon-theme Papirus")),
    EzKey("M-S-e", lazy.spawn(terminal + " -e nnn -d")),
    EzKey("M-e", lazy.spawn("thunar")),
    EzKey("M-S-s", lazy.spawn("flameshot gui")),
    EzKey("M-p", lazy.spawn("pavucontrol")),
]

colors = [["#282C34"],  # panel background
          ["#3d3f4b"],  # background for current screen tab
          ["#ffffff"],  # font color for group names
          ["#FF7171"],  # border line color for current tab
          ["#74438f"],  # border line color for 'other tabs' and color for 'odd widgets'
          ["#6886C5"],  # color for the 'even widgets'
          ["#ff5131"],  # window name
          ["#92967D"]]  # foreground for inactive screens

# One dark colors
one_dark = [["#282C34"],  # black
            ["#E06c75"],  # red
            ["#98C379"],  # green
            ["#E5C07B"],  # yellow
            ["#61AFEF"],  # blue
            ["#C678DD"],  # magenta
            ["#56B6C2"],  # cyan
            ["#ABB2BF"]]  # white

group_names = [(" NET", {'layout': 'monadtall'}),
               (" DEV", {'layout': 'monadtall'}),
               (" TERM", {'layout': 'monadtall'}),
               (" VIRT", {'layout': 'monadtall'}),
               (" SYS", {'layout': 'monadtall'}),
               (" MAIL", {'layout': 'monadtall'}),
               ]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

layouts = [
    layout.MonadTall(border_focus=one_dark[1], border_width=2, margin=5),
    layout.MonadWide(bborder_focus=one_dark[1], order_width=1, margin=5),
    layout.Matrix(border_focus=one_dark[1], order_width=1, margin=5),
    layout.Max(),
]

widget_defaults = dict(
    font='jetbrains mono bold',
    fontsize=12,
    padding=8,
    background=one_dark[0]
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(
                    linewidth=0,
                    padding=6,
                    foreground=colors[2],
                    background=colors[0]
                ),
                widget.GroupBox(
                    fontsize=12,
                    margin_y=3,
                    margin_x=0,
                    padding_y=5,
                    padding_x=3,
                    borderwidth=3,
                    active=colors[2],
                    inactive=colors[7],
                    rounded=False,
                    highlight_color=colors[1],
                    highlight_method="line",
                    this_current_screen_border=colors[6],
                    this_screen_border=colors[4],
                    other_current_screen_border=colors[6],
                    other_screen_border=colors[4],
                    foreground=colors[2],
                    background=colors[0]
                ),
                widget.Prompt(),
                widget.Sep(
                    linewidth=0,
                    foreground=colors[2],
                    background=colors[0]
                ),
                widget.WindowName(
                    fontsize=12,
                    foreground=one_dark[1]
                ),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Systray(),
                widget.Sep(
                    linewidth=0,
                    padding=8,
                    foreground=colors[2],
                    background=colors[0]
                ),
                widget.TextBox(
                    text="",
                    foreground=one_dark[4],
                    padding=0
                ),
                widget.Volume(
                    foreground=one_dark[4],
                    step=5,
                ),
                widget.Clock(
                    foreground=one_dark[2],
                    format=' %a %d %b %I:%M %p',
                ),
                widget.CurrentLayout(background='776D8A'),
                # widget.QuickExit(foreground='CD5D7D'),
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
    Match(wm_class='Lxappearance'),
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True

#wmname = "LG3D"
wmname = "qtile"


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.call([home])
