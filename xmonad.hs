-- Judeka's XMonad config --
----------------------------

-- General imports
----
import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Ungrab
import Graphics.X11.ExtraTypes.XF86
import XMonad.ManageHook
import XMonad.Util.SpawnOnce (spawnOnce)
import XMonad.Hooks.ManageHelpers
import XMonad.Prompt
import XMonad.Util.Run
import XMonad.Prompt.Shell

-- Window & pane imports
----
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Spiral
import XMonad.Layout.NoBorders
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.WindowSwallowing

-- XMobar imports
----
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.Loggers
import XMonad.Layout.Spacing
import XMonad.Layout.Gaps

-- Window layouts
-- spacing and gaps are applied only to spiral & mirror tiled
-- (could be organized neater)
----
myLayouts = gaps [(U,5), (D,5), (L,5), (R,5)] (spacing 5 $ spiral (6/7) ||| Mirror tiled) ||| noBorders Full
    where
        tiled = Tall nmaster delta ratio
        nmaster = 2     -- number of windows in master
        ratio = 1/2     -- fraction of screen master occupies
        delta = 5/100   -- pane resize percent

-- Borders
----
myBorderWidth = 3
myNormalBorderColor = "#1c1c1c"
myFocusedBorderColor = "#49439d"

-- Workspaces
----
myWorkspaces = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]

-- HandleEventHook
----
myHandleEventHook = swallowEventHook (className =? "Alacritty") (return True) -- swallows term window when spawning things

-- StartupHook
----
myStartupHook :: X()
myStartupHook = do
    spawnOnce "feh --bg-fill ~/Pictures/wallpapers/waterfall.jpg"
    spawnOnce "picom --config ~/.config/picom/picom.conf"   -- start the compositor
--    spawnOnce "xwinwrap -ov -g 1920x1080+0+0 -- mpv -wid %WID ~/Pictures/wallpapers/px_dusk.gif --no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings"
    
-- ManageHook
----
myManageHook :: ManageHook
myManageHook = composeAll
    [
        title =? "Picture in picture" --> doFloat
        , title =? "untitled" --> doCenterFloat
        , className =? "Pavucontrol" --> doCenterFloat
        , className =? "mpv" --> doFloat
        , isDialog --> doCenterFloat
        , isFullscreen --> doFullFloat
        , transience'
    ]

-- Default apps and variables
----
myTerminal = "alacritty"
myFont = "xft:Inter Regular:style=regular:pixelsize=14"

-- Prompt config
----
myPrompt :: XPConfig
myPrompt = def -- TODO: needs better styling and options
    {
        font = myFont
        , bgColor = "#000000"
        , fgColor = "#c5c8e6"
        , bgHLight = "#c5c8e6"
        , fgHLight = "#000000"
        , promptBorderWidth = 0
        , position = Top
        , height = 27
        , maxComplRows = Just 5
        , showCompletionOnTab = False
        , historySize = 0
        , defaultPrompter = const " >>=   "
    }

-- Defaults and keybinds
----
myConfig = def
    {
        modMask = mod4Mask
        , layoutHook = smartBorders myLayouts
        , terminal = myTerminal
        , borderWidth = myBorderWidth
        , normalBorderColor = myNormalBorderColor
        , focusedBorderColor = myFocusedBorderColor
        , workspaces = myWorkspaces
        , startupHook = myStartupHook
        , handleEventHook = myHandleEventHook
        , manageHook = myManageHook
    }
    `additionalKeysP`
    [
        ("<XF86AudioMute>", spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle")
        , ("<XF86AudioRaiseVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ +10%")
        , ("<XF86AudioLowerVolume>", spawn "pactl set-sink-volume @DEFAULT_SINK@ -10%")
        , ("<XF86MonBrightnessDown>", spawn "xbacklight -dec 10")
        , ("<XF86MonBrightnessUp>", spawn "xbacklight -inc 10")
        , ("M-S-r", spawn "xmonad --recompile & xmonad --restart & xmonad --replace")
        , ("M-d", shellPrompt myPrompt)
        -- , ("M-d", unGrab *> spawn "rofi -show drun")
        , ("M-S-s", spawn "scrot ~/Pictures/screenshots/")
        , ("M-f", spawn "thunar")
    ]

-- XMobar and Pretty Print definitions
----
myXmobarPP :: PP
myXmobarPP = def
    {
        ppSep = wrap "   " "   " $ lowWhite " <fn=1>\987308</fn> "
        , ppTitle = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 20
        , ppTitleSanitize = xmobarStrip
        , ppCurrent = wrap "   " "" . const "<fn=2>\984933</fn>"
        , ppVisible = white . wrap "   " "" . const "<fn=2>\984933</fn>"
        , ppHidden = white . wrap "   " "" . const "<fn=2>\984934</fn>"
        , ppHiddenNoWindows = lowWhite . const ""    -- left as is for later use
        , ppUrgent = red . wrap "   " ""
        , ppOrder = \(ws : _ : tit : _) -> [ws, tit]    -- extras can be added
    }
    where
        formatFocused = wrap (white "[") (white "]") . magenta . ppWindow
        ppWindow :: String -> String
        ppWindow = xmobarRaw . (\w -> if null w then "nil" else w) . shorten 20

-- Color definitions (this is still part of "myXmobarPP")
----
        blue, lowWhite, magenta, red, white, yellow :: String -> String
        magenta = xmobarColor "#ff79c6" ""
        blue = xmobarColor "#49439d" ""
        white = xmobarColor "#c5c8e6" ""
        yellow = xmobarColor "#f1fa8c" ""
        red = xmobarColor "#ff5555" ""
        lowWhite = xmobarColor "#cccccc" ""

-- The main function
----
main :: IO ()
main = xmonad
     . ewmhFullscreen
     . ewmh
     . withEasySB (statusBarProp "xmobar ~/.config/xmobar/xmobar.hs" (pure myXmobarPP)) defToggleStrutsKey
     $ myConfig

