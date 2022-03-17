from libqtile.config import Group, Match

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
