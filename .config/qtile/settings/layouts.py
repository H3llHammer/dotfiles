from libqtile import layout
from settings.colors import Colors

layouts = [
    layout.MonadTall(border_focus=Colors["Red"], border_width=1, margin=10),
    layout.MonadWide(bborder_focus=Colors["Red"], order_width=1, margin=10),
    layout.Matrix(border_focus=Colors["Red"], order_width=1, margin=10),
    layout.Max(),
    layout.Floating(),
]
