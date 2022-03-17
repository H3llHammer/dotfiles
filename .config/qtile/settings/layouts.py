from libqtile import layout
from settings.colors import one_dark

layouts = [
    layout.MonadTall(border_focus=one_dark[1], border_width=1, margin=10),
    layout.MonadWide(bborder_focus=one_dark[1], order_width=1, margin=10),
    layout.Matrix(border_focus=one_dark[1], order_width=1, margin=10),
    layout.Max(),
    layout.Floating(),
]
