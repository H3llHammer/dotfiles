from libqtile.config import Key, Match, Group
from libqtile.lazy import lazy
from keys import keys


group_names = [("", {'layout': 'monadtall'}),
               ("", {
                   'layout': 'monadtall',
                   'matches': [Match(wm_class=('firefox',))],
               }),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ("", {'layout': 'monadtall'}),
               ]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    # Switch to another group
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))
