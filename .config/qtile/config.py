import os.path
import subprocess
from libqtile import layout, hook
from libqtile.config import Click, Drag, Key, Match
from libqtile.lazy import lazy

from settings.keys import mod, keys
from settings.colors import Colors
from settings.groups import groups, group_names
from settings.screens import screens
from settings.layouts import layouts

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

widget_defaults = dict(
    font='JetBrains Mono NL:style=Bold',
    fontsize=12,
    padding=8,
    background=Colors["background"],
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
