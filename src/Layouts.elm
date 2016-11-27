module Layouts exposing (..)

{-|

Html Elements that are conveneient for layout.

You can use these directly in your view function.

-}

import Style
import Html exposing (Html)
import Html.Attributes
import Style.Render
import Style.Model exposing (VerticalAlignment, Alignment)


stylesheet : Style.StyleSheet msg
stylesheet =
    Style.render
        [ centeredStyle
        , completelyCenteredStyle
        , splitStyle
        , floatLeftStyle
        , floatRightStyle
        , floatTopLeftStyle
        , floatTopRightStyle
        ]


{-| -}
centered : List (Html msg) -> Html msg
centered spacing nodes =
    Html.div
        [ stylesheet.class centeredStyle ]
        nodes


{-| -}
completelyCentered : List (Html msg) -> Html msg
completelyCentered spacing nodes =
    Html.div
        [ stylesheet.class completelyCenteredStyle ]
        nodes


{-| -}
split : List (Html msg) -> Html msg
split spacing nodes =
    Html.div
        [ stylesheet.class split ]
        nodes


{-| -}
floatRight : List (Html msg) -> Html msg
floatRight nodes =
    Html.div
        [ stylesheet.class floatRightStyle ]
        nodes


{-| -}
floatLeft : List (Html msg) -> Html msg
floatLeft nodes =
    Html.div
        [ stylesheet.class floatLeftStyle ]
        nodes


{-| -}
floatTopLeft : List (Html msg) -> Html msg
floatTopLeft nodes =
    Html.div
        [ stylesheet.class floatTopLeftStyle ]
        nodes


{-| -}
floatTopRight : List (Html msg) -> Html msg
floatTopRight nodes =
    Html.div
        [ stylesheet.class floatTopRightStyle ]
        nodes



---------------
-- Styles
---------------


centeredStyle : Style.Model
centeredStyle =
    Style.empty
        |> Style.spacing (all 10)
        |> Style.flowRight
            { wrap = True
            , horizontal = Style.alignCenter
            , vertical = Style.alignTop
            }


completelyCenteredStyle : Style.Model
completelyCenteredStyle =
    Style.empty
        |> Style.spacing (all 10)
        |> Style.flowRight
            { wrap = True
            , horizontal = Style.alignCenter
            , vertical = Style.verticalCenter
            }


splitStyle : Style.Model
splitStyle =
    Style.empty
        |> Style.spacing (all 10)
        |> Style.flowRight
            { wrap = False
            , horizontal =
                Style.justify
                -- this makes it so the children elements hug the sides.
                -- Perfect for a nav with a right and left section
            , vertical = Style.verticalCenter
            }


floatLeftStyle : Style.Model
floatLeftStyle =
    Style.empty
        |> Style.floatLeft


floatRightStyle : Style.Model
floatRightStyle =
    Style.empty
        |> Style.floatRight


floatTopLeftStyle : Style.Model
floatTopLeftStyle =
    Style.empty
        |> Style.floatTopLeft


floatTopRightStyle : Style.Model
floatTopRightStyle =
    Style.empty
        |> Style.floatTopRight
