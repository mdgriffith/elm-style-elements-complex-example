module StyleSheet exposing (..)

import Style exposing (..)
import Style.Media
import Html exposing (Html)
import Color exposing (Color)
import Color.Mixing
import Time exposing (Time, second)


--------------------
-- Define Palettes
--------------------


fonts =
    { body =
        { normal =
            Style.mix
                [ font "'Noto Sans', Georgia"
                , fontsize 16
                , lineHeight 1.7
                ]
        , large =
            Style.mix
                [ font "'Noto Sans', Georgia"
                , fontsize 22
                , lineHeight 1.2
                ]
        }
    , code =
        Style.mix
            [ font "Inconsolata, Courier"
            , fontsize 16
            , lineHeight 1
            ]
    }


{-| Defining all your colors in one place makes fixing color issues a breeze on apps with large style sheets.

-}
colors =
    { white = Color.white
    , black = Color.rgb 10 10 10
    , transparent = Color.rgba 255 255 255 0
    , grey =
        { darkest = Color.darkCharcoal
        , darker = Color.charcoal
        , dark = Color.lightCharcoal
        , medium = Color.darkGrey
        , light = Color.grey
        , lighter = Color.lightGrey
        , lightest = Color.rgb 245 245 245
        }
    , blue =
        { dark = Color.Mixing.darken 0.1 (Color.rgb 12 148 200)
        , normal = Color.rgb 12 148 200
        , light = Color.Mixing.lighten 0.1 (Color.rgb 12 148 200)
        }
    , red =
        { dark = Color.Mixing.darken 0.1 Color.red
        , normal = Color.red
        , light = Color.Mixing.lighten 0.1 Color.red
        }
    }


palette =
    { standard =
        Style.mix
            [ backgroundColor
                colors.transparent
            , textColor
                colors.black
            , borderColor
                colors.grey.light
            ]
    , button =
        Style.mix
            [ borderColor
                colors.blue.dark
            , backgroundColor
                colors.blue.normal
            , textColor
                colors.white
            ]
    , nav =
        Style.mix
            [ borderColor
                colors.grey.lighter
            , backgroundColor
                colors.grey.light
            , textColor
                colors.grey.darker
            ]
    }



--background = lightGrey
--    , text = lightCharcoal
--    , border = darker
--let
--    transparent =
--        Color.rgba 255 255 255 0
--    lightGrey =
--        Color.lightGrey
--    lightCharcoal =
--        Color.lightCharcoal
--    dark =
--        Color.darkCharcoal
--    darker =
--        Color.rgb 230 230 230
--    blue =
--        Color.rgb 12 148 200
--    red =
--        Color.red
--    white =
--        Color.white
--    darkBlue =
--        Color.rgb 7 111 151
--in
--{ normal =
--    { background = transparent
--    , text = dark
--    , border = darker
--    }
--, link =
--    { background = transparent
--    , text = red
--    , border = darker
--    }
--, blue =
--    { background = blue
--    , text = white
--    , border = blue
--    }
--, red =
--    { background = red
--    , text = white
--    , border = dark
--    }
--, greyBackground =
--    { background = lightCharcoal
--    , text = dark
--    , border = darker
--    }
--, navigation =
--    { background = lightGrey
--    , text = lightCharcoal
--    , border = darker
--    }
--, navigationHover =
--    { background = lightGrey
--    , text = red
--    , border = darker
--    }
--, button =
--    { border = darkBlue
--    , background = blue
--    , text = white
--    }
--, searchBar =
--    { background = Color.grey
--    , text = Color.charcoal
--    , border = Color.lightGrey
--    }
--, searchBarFocused =
--    { background = Color.white
--    , text = Color.lightCharcoal
--    , border = Color.lightGrey
--    }
--}



--------------------
-- Define Base Style
--------------------


{-| We insert this as a "base" style to our stylesheet.  This means every style starts with these properties.
-}
common : List Style.Property
common =
    Style.foundation
        ++ [ palette.standard
           , fonts.body.normal
           , transition
                { property = "all"
                , duration = 300
                , easing = "ease-out"
                , delay = 0
                }
           ]


type Class
    = Base
    | Nav
    | Container
    | Article
    | Sidebar
    | P
    | Link
    | NavLink
    | Header
    | Box
    | SmallBox
    | MediaQueryExample
    | Button
    | RotatingBox
    | SubtleLevitate
    | SearchBar
    | StrikeThrough


stylesheet : Style.StyleSheet Class msg
stylesheet =
    Style.renderWith
        [ Style.autoImportGoogleFonts, Style.base common ]
        [ class Base []
        , class Nav
            [ palette.nav
            , width (percent 100)
            , padding (leftRightAndTopBottom 30 15)
            , positionBy screen
            , topLeft 0 0
            , zIndex 10
            , minWidth (px 1000)
            , flowRight
                { wrap = False
                , horizontal =
                    justify
                    -- this makes it so the children elements hug the sides.
                    -- Perfect for a nav with a right and left section
                , vertical = verticalCenter
                }
            ]
        , class Container
            [ padding (topBottom 100)
            , minWidth (px 1000)
            , flowLeft
                { wrap = True
                , horizontal = alignCenter
                , vertical = alignTop
                }
            ]
        , class Article
            [ width (px 700)
            , padding (all 20)
            , spacing (all 40)
            ]
        , class Sidebar
            [ width (px 300)
            , padding (all 20)
            , spacing (topBottom 40)
            ]
        , class P
            [ spacing (all 20)
            ]
        , class Link
            [ textColor colors.grey.darker
            , underline
            , cursor "pointer"
            ]
        , class NavLink
            [ padding (left 20)
            , textColor colors.grey.darkest
            , hover
                [ textColor colors.red.normal
                , cursor "pointer"
                ]
            ]
        , class Header
            [ fonts.body.large
            ]
        , class Box
            [ width (px 180)
            , height (px 180)
            , padding (all 20)
            , backgroundColor colors.blue.normal
            , textColor colors.white
            , flowRight
                { wrap = True
                , horizontal = alignCenter
                , vertical = verticalCenter
                }
            ]
        , class SmallBox
            [ width (px 120)
            , height (px 120)
            , padding (all 20)
            , backgroundColor colors.blue.normal
            , textColor colors.white
            , flowRight
                { wrap = True
                , horizontal = alignCenter
                , vertical = verticalCenter
                }
            ]
        , class MediaQueryExample
            [ width (px 180)
            , height (px 180)
            , padding (all 20)
            , backgroundColor colors.blue.normal
            , textColor colors.white
            , flowRight
                { wrap = True
                , horizontal = alignCenter
                , vertical = verticalCenter
                }
            , Style.Media.phoneOnly
                [ backgroundColor colors.red.normal
                ]
            , Style.Media.tabletPortraitOnly
                [ borderWidth (all 5)
                , borderRadius (all 15)
                ]
            ]
        , class Button
            [ padding (leftRightAndTopBottom 30 15)
            , borderStyle solid
            , borderWidth (all 0)
            , borderRadius (all 2)
            , palette.button
            , shadows
                [ shadow
                    { offset = ( 0, 2 )
                    , blur = 5
                    , size = 0
                    , color = Color.rgba 0 0 0 0.26
                    }
                ]
            , hover
                [ cursor "pointer"
                , shadows
                    [ shadow
                        { offset = ( 0, 4 )
                        , blur = 5
                        , size = 0
                        , color = Color.rgba 0 0 0 0.26
                        }
                    ]
                , transforms [ translate 0 -2 0 ]
                ]
            ]
        , class RotatingBox
            [ backgroundColor colors.blue.normal
            , textColor colors.white
            , width (px 50)
            , height (px 50)
            , animate
                { duration = (5 * second)
                , easing = "linear"
                , repeat = forever
                , steps =
                    [ ( 0, [ transforms [ rotate 0 0 0 ] ] )
                    , ( 100, [ transforms [ rotate 0 0 (2 * pi) ] ] )
                    ]
                }
            ]
        , class SubtleLevitate
            [ backgroundColor colors.blue.normal
            , textColor colors.white
            , textColor colors.white
            , width (px 50)
            , height (px 50)
            , shadows
                [ shadow
                    { offset = ( 0, 2 )
                    , blur = 5
                    , size = 0
                    , color = Color.rgba 0 0 0 0.26
                    }
                ]
            , hover
                [ shadows
                    [ shadow
                        { offset = ( 0, 4 )
                        , blur = 5
                        , size = 0
                        , color = Color.rgba 0 0 0 0.26
                        }
                    ]
                , transforms [ translate 0 -2 0 ]
                ]
            ]
        , class SearchBar
            [ width (px 350)
            , padding (leftRightAndTopBottom 10 5)
            , backgroundColor colors.grey.lighter
            , textColor colors.grey.darkest
            , borderWidth (all 1)
            , borderStyle solid
            , borderRadius (all 3)
            , borderColor colors.grey.medium
            , focus
                [ backgroundColor colors.grey.lighter
                , textColor Color.lightCharcoal
                ]
            ]
        , Style.selector "hr"
            [ height (px 1)
            , width (percent 100)
            , backgroundColor colors.grey.darker
            , inline
            ]
        , class StrikeThrough
            [ inline
            , strike
            ]
        ]


{-| -}
forever : Float
forever =
    1.0 / 0
