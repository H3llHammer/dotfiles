from libqtile.config import Screen
from libqtile import widget, bar
from settings.colors import colors, one_dark

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
