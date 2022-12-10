Config 
    { overrideRedirect = False
    , font = "xft:Inter Regular:style=regular:pixelsize=13"
    , additionalFonts = 
        [ "xft:Material Design Icons:size=13:antialias=true"
        , "xft:Material Design Icons:size=10:antialias=true"
        , "xft:Inter Regular:style=bold:pixelsize=13"
        , "xft:Material Design Icons:size=15:antialias=true"
        ]
    , bgColor = "#000000"
    , fgColor = "#c5c8e6"
    , alpha = 255
    , position = TopSize C 100 30
    , lowerOnStart = True
    , pickBroadest = True
    , border = BottomB
    , borderWidth = 3
    , borderColor = "#1c1c1c"
    , commands =
        [ Run MultiCpu
            [ "--template", "<fn=1><bar></fn>"
            , "-S", "Off", "-d", "0", "-m", "3"
            , "-L", "10", "-H", "90", "-p", "3"
            , "-W", "0"
            , "-f", "󰋙󰫃󰫄󰫅󰫆󰫇󰫈"
            ] 10
        , Run Alsa "default" "Master"
            [ "--template", "<fn=1><volumebar></fn>"
            , "-S", "Off", "-d", "0", "-m", "3"
            , "-L", "10", "-H", "90", "-p", "3"
            , "-W", "0"
            , "-f", "󰖁󰕿󰕿󰖀󰖀󰕾󰕾󰕾"
            , "--"
            , "--on", ""
            ]
        , Run Memory
            [ "--template", "<fn=1><usedbar></fn>"
            , "-S", "Off", "-d", "0", "-m", "3"
            , "-L", "10", "-H", "90", "-p", "3"
            , "-W", "0"
            , "-f", "󰝦󰪞󰪟󰪠󰪡󰪢󰪣󰪤󰪥"
            ] 10
        , Run Date "%I:%M %p" "date" 10
        , Run Wireless ""
            [ "--template", "<fn=1><qualitybar></fn>"
            , "-S", "Off", "-d", "0", "-m", "3"
            , "-L", "10", "-H", "90", "-p", "3"
            , "-W", "0"
            , "-f", "󰤮󰤯󰤟󰤢󰤥󰤨"
            ] 50
        , Run Battery
            [ "-t", "<acstatus>"
            , "-S", "Off", "-d", "0", "-m", "3"
            , "-L", "10", "-H", "90", "-p", "3"
            , "-W", "0"
            , "-f", "󰂃󰁺󰁻󰁽󰁾󰁿󰂀󰂁󰂂󰁹"
            , "--"
            , "-P"
            , "-a", "notify-send -u critical '5% of battery remaining'"
            , "-A", "5"
            , "-i", "<fn=1><leftbar></fn>"
            , "-O", "<fn=1><leftbar></fn>"
            , "-o", "<fn=1><leftbar></fn>"
            , "-H", "10", "-L", "7"
            ] 50
        , Run XMonadLog
        ]
    , sepChar  = "%"
    , alignSep = "}{"
    , template = "    <fc=#6963f0><fn=4>󰲒</fn></fc> %XMonadLog% }<fn=0>%date%</fn>{ %alsa:default:Master%    |    %memory%    %multicpu%    |    %wi%    %battery%    "
    }
