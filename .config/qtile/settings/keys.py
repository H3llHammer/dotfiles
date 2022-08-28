from libqtile.config import EzKey
from libqtile.config import Key
from libqtile.lazy import lazy

terminal = "prime-run kitty"
mod = "mod4"

keys = [
    # Switch between groups
    EzKey("M-i", lazy.screen.next_group()),  # Move to the group on the right
    EzKey("M-u", lazy.screen.prev_group()),  # Move to the group on the left
    # Move to the last visited group
    EzKey("M-<Tab>", lazy.screen.toggle_group()),

    # Switch between windows
    EzKey("M-h", lazy.layout.left()),   # Move focus to left
    EzKey("M-l", lazy.layout.right()),  # Move focus to right
    EzKey("M-j", lazy.layout.down()),   # Move focus down
    EzKey("M-k", lazy.layout.up()),     # Move focus up
    # Move window focus to other window
    EzKey("M-<space>", lazy.layout.next()),

    # Monadtall/Monadwide
    EzKey("M-S-h", lazy.layout.shuffle_left()),   # Move window to the left
    EzKey("M-S-l", lazy.layout.shuffle_right()),  # Move window to the right
    EzKey("M-S-j", lazy.layout.shuffle_down()),   # Move window down"),
    EzKey("M-S-k", lazy.layout.shuffle_up()),     # Move window up"),
    EzKey("M-S-i", lazy.layout.grow()),
    EzKey("M-S-u", lazy.layout.shrink()),
    EzKey("M-n", lazy.layout.normalize()),
    EzKey("M-o", lazy.layout.maximize()),
    EzKey("M-S-<space>", lazy.layout.flip()),

    # Toggle between different layouts as defined below
    EzKey("M-S-<Tab>", lazy.next_layout()),  # Toggle between layouts
    EzKey("M-w", lazy.window.kill()),        # Kill focused window
    # Put the focused window to/from fullscreen mode
    EzKey("M-f", lazy.window.toggle_fullscreen()),
    # Put the focused window to/from floating mode
    EzKey("M-S-f", lazy.window.toggle_floating()),

    # Shutdown and Restart
    EzKey("M-C-r", lazy.restart(),),   # Restart Qtile
    EzKey("M-C-q", lazy.shutdown(),),  # Shutdown Qtile

    # Media
    EzKey("M-S-u", lazy.spawn("amixer set Master 5%+")),   # Volume up
    EzKey("M-S-d", lazy.spawn("amixer set Master 5%-")),   # Volume down
    EzKey("M-S-m", lazy.spawn("amixer -D pulse set Master 1+ toggle")),   # Volume down
    EzKey("M-C-u", lazy.spawn("amixer set Capture 5%+")),  # Microphone up
    EzKey("M-C-d", lazy.spawn("amixer set Capture 5%-")),  # Microphone down
    EzKey("M-C-m", lazy.spawn("amixer -D pulse set Capture 1+ toggle")),  # Microphone down

    # Hotkeys
    EzKey("M-<Return>", lazy.spawn(terminal)),
    EzKey("M-d", lazy.spawn("rofi -show drun -show-icons -icon-theme Papirus")),
    EzKey("M-S-e", lazy.spawn(terminal + " -e ranger")),
    EzKey("M-e", lazy.spawn("thunar")),
    EzKey("M-S-s", lazy.spawn("flameshot gui")),
    EzKey("M-p", lazy.spawn("pavucontrol")),
    EzKey("M-r", lazy.spawn("dmenu_run -fn 'JetBrains Mono NL:Bold:pixelsize=16'")),

    # Audio
    Key([], 'XF86AudioRaiseVolume', lazy.spawn('amixer set Master 5%+')),
    Key([], 'XF86AudioLowerVolume', lazy.spawn('amixer set Master 5%-')),
    Key([], 'XF86AudioMute', lazy.spawn('amixer -D pulse set Master 1+ toggle')),
    
    # brightness 
    Key([], 'XF86MonBrightnessUp', lazy.spawn('xbacklight +10')),
    Key([], 'XF86MonBrightnessDown', lazy.spawn('xbacklight -10')),
]
