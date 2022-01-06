import XMonad
import Data.Monoid
import System.Exit

import XMonad.Actions.CycleWS
import XMonad.Actions.CycleWorkspaceByScreen

import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.WorkspaceHistory
import XMonad.Hooks.InsertPosition

import XMonad.Util.Run
import XMonad.Util.SpawnOnce

import XMonad.Layout.Spacing
import XMonad.Layout.Grid
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed

import qualified XMonad.StackSet as W
import qualified Data.Map        as M

-- Terminal
myTerminal :: String
myTerminal = "urxvt"

-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

-- Width of the window border in pixels.
myBorderWidth   = 2

-- The default number of workspaces (virtual screens) and their names.
myWorkspaces    = ["1","2","3","4","5","6","7","8","9"]

-- Border colors for unfocused and focused windows, respectively.
myNormalBorderColor  = "#dddddd"
myFocusedBorderColor = "#94B3FD"

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm,		    xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenu
    , ((modm,               xK_p     ), spawn "dmenu_run -p 'Arch Linux' -fn 'JetBrains Mono NL:Regular:pixelsize=14'")

    -- launch rofi
    , ((modm .|. shiftMask, xK_p     ), spawn "rofi -show drun")

    -- close focused window
    , ((modm,		    xK_c     ), kill)

    -- Take a snapshot with flameshot
    , ((modm .|. shiftMask, xK_s     ), spawn "flameshot gui")

    -- ResizableTall
    , ((modm,               xK_a), sendMessage MirrorShrink)
    , ((modm,               xK_z), sendMessage MirrorExpand)

    -- a basic CycleWS setup
    , ((modm,               xK_Up),  nextWS)
    , ((modm,               xK_Down),    prevWS)

    -- CycleWorkspaceByScreen
    , ((modm, xK_Tab), cycleWorkspaceOnCurrentScreen [xK_Super_L] xK_Tab xK_grave)

     -- Rotate through the available layout algorithms
    , ((modm,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modm,               xK_n     ), refresh)

    -- Move focus to the next window
    --, ((modm,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm,               xK_k     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modm,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modm,               xK_h     ), sendMessage Shrink)

    -- Expand the master area
    , ((modm,               xK_l     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))

    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    , ((modm              , xK_b     ), sendMessage ToggleStruts)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "xmonad --recompile; xmonad --restart")

    -- Run xmessage with a summary of the default keybindings (useful for beginners)
    , ((modm .|. shiftMask, xK_slash ), spawn ("echo \"" ++ help ++ "\" | xmessage -file -"))
    ]
    ++

    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++

    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]


------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

------------------------------------------------------------------------
-- Layouts:

myLayout = avoidStruts $ tiled ||| Full ||| grid ||| threeCol ||| mirror
  where
     threeCol = renamed [Replace "ThreeCol"] $ spacingWithEdge 6 $ ThreeColMid nmaster delta ratio

     grid     = renamed [Replace "Grid"] $ spacingWithEdge 6 $  Grid

     mirror   = renamed [Replace "Mirror"] $ spacingWithEdge 6 $ Mirror (Tall 1 (3/100) (3/5))

     -- default tiling algorithm partitions the screen into two panes
     tiled   = renamed [Replace "Tiled"] $ 
	spacingWithEdge 6 $ 
	ResizableTall nmaster delta ratio []

     -- The default number of windows in the master pane
     nmaster = 1

     -- Default proportion of screen occupied by master pane
     ratio   = 1/2

     -- Percent of screen to increment by when resizing panes
     delta   = 3/100


------------------------------------------------------------------------
-- Window rules:
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "PacketTracer"   --> doFloat
    , className =? "Pavucontrol"   --> doFloat
    , className =? "xdman-Main"   --> doFloat
    , className =? "Sxiv"   --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore ]

------------------------------------------------------------------------
-- Event handling

-- * EwmhDesktops users should change this to ewmhDesktopsEventHook
--
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
myEventHook = mempty

------------------------------------------------------------------------
-- Startup hook
myStartupHook :: X ()
myStartupHook = do
	spawnOnce "killall trayer"
	spawnOnce "nitrogen --restore &"
	spawnOnce "picom &"
	spawnOnce "trayer --edge top --align right --widthtype request --padding 6 --SetDockType true --SetPartialStrut true --expand true --transparent true --alpha 0 --tint       0x282C34 --height 22 --monitor 1 &"
	spawnOnce "volumeicon &"
------------------------------------------------------------------------
main = do 
    xmproc <- spawnPipe "xmobar -x 0 /home/alberto/.config/xmobar/xmobarrc"
    xmonad $ docks def {
      -- simple stuff
        terminal           = myTerminal,
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = myBorderWidth,
        modMask            = mod4Mask,
        workspaces         = myWorkspaces,
        normalBorderColor  = myNormalBorderColor,
        focusedBorderColor = myFocusedBorderColor,

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayout,
        manageHook         = insertPosition End Newer <+> myManageHook,
        handleEventHook    = myEventHook,
	logHook = workspaceHistoryHook <+> dynamicLogWithPP xmobarPP 
	    { ppOutput  = hPutStrLn xmproc
	    , ppCurrent = xmobarColor "#98be65" "" . wrap "[" "]" -- Current workspace in xmobar
	    , ppVisible = xmobarColor "#98be65" ""		  -- Visible but not current workspace
	    , ppHidden  = xmobarColor "#82AAFF" "" . wrap "°" ""  -- Hidden workspaces in xmobar
	    , ppHiddenNoWindows = xmobarColor "#c792ea" ""	  -- Hidden workspaces (no windows)
	    , ppLayout  = xmobarColor "#B97A95" ""
	    , ppTitle = xmobarColor "#98be65" "" . shorten 60     -- Title of active window in xmobar
	    , ppSep   = "<fc=#666666> <fn=1>|</fn> </fc>"         -- Separators in xmobar
	    , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"  -- Urgent workspace
	    }
        ,startupHook        = myStartupHook
    }

-- | Finally, a copy of the default bindings in simple textual tabular format.
help :: String
help = unlines ["The default modifier key is 'alt'. Default keybindings:",
    "",
    "-- launching and killing programs",
    "mod-Shift-Enter  Launch xterminal",
    "mod-p            Launch dmenu",
    "mod-Shift-p      Launch gmrun",
    "mod-Shift-c      Close/kill the focused window",
    "mod-Space        Rotate through the available layout algorithms",
    "mod-Shift-Space  Reset the layouts on the current workSpace to default",
    "mod-n            Resize/refresh viewed windows to the correct size",
    "",
    "-- move focus up or down the window stack",
    "mod-Tab        Move focus to the next window",
    "mod-Shift-Tab  Move focus to the previous window",
    "mod-j          Move focus to the next window",
    "mod-k          Move focus to the previous window",
    "mod-m          Move focus to the master window",
    "",
    "-- modifying the window order",
    "mod-Return   Swap the focused window and the master window",
    "mod-Shift-j  Swap the focused window with the next window",
    "mod-Shift-k  Swap the focused window with the previous window",
    "",
    "-- resizing the master/slave ratio",
    "mod-h  Shrink the master area",
    "mod-l  Expand the master area",
    "",
    "-- floating layer support",
    "mod-t  Push window back into tiling; unfloat and re-tile it",
    "",
    "-- increase or decrease number of windows in the master area",
    "mod-comma  (mod-,)   Increment the number of windows in the master area",
    "mod-period (mod-.)   Deincrement the number of windows in the master area",
    "",
    "-- quit, or restart",
    "mod-Shift-q  Quit xmonad",
    "mod-q        Restart xmonad",
    "mod-[1..9]   Switch to workSpace N",
    "",
    "-- Workspaces & screens",
    "mod-Shift-[1..9]   Move client to workspace N",
    "mod-{w,e,r}        Switch to physical/Xinerama screens 1, 2, or 3",
    "mod-Shift-{w,e,r}  Move client to screen 1, 2, or 3",
    "",
    "-- Mouse bindings: default actions bound to mouse events",
    "mod-button1  Set the window to floating mode and move by dragging",
    "mod-button2  Raise the window to the top of the stack",
    "mod-button3  Set the window to floating mode and resize by dragging"]
