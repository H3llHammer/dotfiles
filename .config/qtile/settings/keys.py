from libqtile.config import EzKey
from libqtile.lazy import lazy

# modifier_keys = {
#   'M': 'mod4',
#   'A': 'mod1',
#   'S': 'shift',
#   'C': 'control',
# }

mod = "mod4"
terminal = "urxvt"

keys = [
    # Switch between windows
    EzKey("M-h", lazy.layout.left(), desc="Move focus to left"),
    EzKey("M-l", lazy.layout.right(), desc="Move focus to right"),
    EzKey("M-j", lazy.layout.down(), desc="Move focus down"),
    EzKey("M-k", lazy.layout.up(), desc="Move focus up"),
    EzKey("M-<space>", lazy.layout.next(),
          desc="Move window focus to other window"),

    # Switch between groups
    EzKey("M-i", lazy.screen.next_group(),
          desc="Move to the group on the right"),
    EzKey("M-u", lazy.screen.prev_group(),
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

    # Hotkeys
    EzKey("M-d", lazy.spawn("rofi -show drun -show-icons -icon-theme Papirus")),
    EzKey("M-S-e", lazy.spawn(terminal + " -e nnn -d")),
    EzKey("M-e", lazy.spawn("thunar")),
    EzKey("M-S-s", lazy.spawn("flameshot gui")),
    EzKey("M-p", lazy.spawn("pavucontrol")),
    EzKey("M-r", lazy.spawn("dmenu_run -p 'Arch Linux' -fn 'JetBrains Mono NL:Regular:pixelsize=14'"))
]
