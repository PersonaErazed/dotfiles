import XMonad
import XMonad.Hooks.ICCCMFocus
import XMonad.Layout.NoBorders
import XMonad.Layout.PerWorkspace
import XMonad.Layout.ThreeColumns
import XMonad.Layout.Magnifier


-----------------------------------------------------------------
mylayoutHook = 
        noBorders(Full) 
    ||| Mirror tiled 
    ||| tiled 
    ||| noBorders(magnifier(tiled))

  where
    -- default tiling algorithm partitions the screen into two panes
    tiled   = Tall nmaster delta ratio
    --
    -- The default number of windows in the master pane
    nmaster = 1
    --
    -- Default proportion of screen occupied by master pane
    ratio   = 2/3
    --
    -- Percent of screen to increment by when resizing panes
    delta   = 3/100
-----------------------------------------------------------------

gimpLayout =
    noBorders( magnifier( ThreeColMid 1 (3/100) (1/2)) )
    ||| noBorders(Full)

myManageHook = composeAll
    [ className =? "gimp"     --> doShift "7:gimp"
    , className =? "gimp-2.8" --> doShift "7:gimp"
    ]

main = xmonad $ 
        defaultConfig 
            { logHook = takeTopFocus
            , workspaces = ["1","2","3","4","5","6","7:gimp","8","9","0"]
            , borderWidth = 1
            , manageHook = myManageHook <+> manageHook defaultConfig
            , layoutHook = 
                  onWorkspace "gimp" gimpLayout $
                  mylayoutHook
            , focusFollowsMouse = False
            }
