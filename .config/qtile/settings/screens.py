from libqtile.config import Screen
from libqtile import widget, bar
from settings.colors import Colors

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    text="",
                    padding_x=4,
                    fontsize=34,
                    background=Colors["oWhite"],
                    foreground=Colors["arch"],
                ),
                widget.TextBox(
                    text="\uE0B0",
                    fontsize=22,
                    padding=0,
                    background=Colors["odBlack"],
                    foreground=Colors["oWhite"],
                ),
                widget.GroupBox(
                    fontsize=23,
                    margin_y=3,
                    margin_x=0,
                    padding=7,
                    borderwidth=2,
                    active=Colors["white"],
                    inactive=Colors["fInactive"],
                    # rounded=False,
                    highlight_color=Colors["backCurrScr"],
                    highlight_method="line",
                    this_current_screen_border=Colors["arch"],  # line
                    this_screen_border=Colors["BlCoT"],
                    other_current_screen_border=Colors["WN"],
                    other_screen_border=Colors["BlCoT"],
                    foreground=Colors["white"],
                    background=Colors["background"],
                ),
                widget.TextBox(
                    text="\uE0B0",
                    fontsize=22,
                    padding=0,
                    foreground=Colors["odBlack"],
                    background="535962",
                ),
                widget.WindowName(
                    font="MesloLGS NF:style=Bold",
                    fontsize=16,
                    padding_x=1,
                    max_chars=65,
                    foreground=Colors["white"],
                    background="535962",
                ),
                widget.TextBox(
                    text="\uE0B2",
                    fontsize=22,
                    padding=0,
                    foreground="4E709D",
                    background="535962",
                ),
                widget.TextBox(
                    text="",
                    fontsize=20,
                    foreground=Colors["white"],
                    background="4E709D",
                    padding=0
                ),
                widget.Volume(
                    foreground=Colors["white"],
                    background="4E709D",
                    fontsize=14,
                    step=5,
                    channel='Master',
                ),
                widget.TextBox(
                    text="",
                    fontsize=13,
                    foreground=Colors["white"],
                    background="4E709D",
                    padding=0
                ),
                widget.Volume(
                    foreground=Colors["white"],
                    background="4E709D",
                    fontsize=14,
                    step=5,
                    channel='Capture',
                ),
                widget.TextBox(
                    text="\uE0B2",
                    fontsize=22,
                    background="4E709D",
                    foreground="52524E",
                    padding=0
                ),
                widget.Clock(
                    foreground=Colors["white"],
                    background="52524E",
                    fontsize=13,
                    format='%a %d %b %I:%M %p',
                ),
                widget.TextBox(
                    text="\uE0B2",
                    fontsize=22,
                    padding=0,
                    background="52524E",
                    foreground="4E709D",
                ),
                widget.Battery(
                    foreground=Colors["white"],
                    background="4E709D",
                    fontsize=13,
                    charge_char="Charging",
                    discharge_char="Discharging",
                    format="{char} {percent:2.0%} ({hour:d}:{min:02d})",
                    show_short_text=True,
                ),
                widget.TextBox(
                    text="\uE0B2",
                    fontsize=22,
                    padding=0,
                    foreground=Colors["odBlack"],
                    background="4E709D",
                ),
                widget.Systray(),
                widget.Sep(
                    linewidth=0,
                    padding=8,
                    foreground=Colors["white"],
                    background=Colors["background"],
                ),
                widget.TextBox(
                    text="\uE0B2",
                    fontsize=22,
                    foreground="AD1D45",
                    padding=0
                ),
                widget.CurrentLayout(
                    font="mononoki Nerd Font:style=Bold",
                    fontsize=13,
                    foreground=Colors["white"],
                    background="AD1D45",
                    padding_x=1,
                ),
            ],
            24,
        ),
    ),
]
