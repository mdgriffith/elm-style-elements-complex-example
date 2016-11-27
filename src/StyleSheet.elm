module StyleSheet exposing (..)

import Style exposing (..)
import Style.Font
import Style.Media
import Html exposing (Html)
import Color
import Time exposing (Time, second)


--------------------
-- Define Palettes
--------------------


type alias MyFonts =
    { body : Style.Font.FontSet
    , code : Style.Font.FontSet
    }


fontPalette : MyFonts
fontPalette =
    { body = Style.Font.create "'Noto Sans', Georgia"
    , code =
        Style.Font.createFrom
            { font = "Inconsolata, Courier"
            , size = 16
            , lineHeight = 1
            , letterOffset = Nothing
            , align = alignLeft
            , whitespace = normal
            }
    }


type alias MyColorPalette =
    { normal : Style.ColorPalette
    , link : Style.ColorPalette
    , blue : Style.ColorPalette
    , red : Style.ColorPalette
    , button : Style.ColorPalette
    , navigation : Style.ColorPalette
    , navigationHover : Style.ColorPalette
    , searchBar : Style.ColorPalette
    , searchBarFocused : Style.ColorPalette
    , greyBackground : Style.ColorPalette
    }


{-| Defining all your colors in one place makes fixing color issues a breeze on apps with large style sheets.

-}
palette : MyColorPalette
palette =
    let
        transparent =
            Color.rgba 255 255 255 0

        lightGrey =
            Color.lightGrey

        lightCharcoal =
            Color.lightCharcoal

        dark =
            Color.darkCharcoal

        darker =
            Color.rgb 230 230 230

        blue =
            Color.rgb 12 148 200

        red =
            Color.red

        white =
            Color.white

        darkBlue =
            Color.rgb 7 111 151
    in
        { normal =
            { background = transparent
            , text = dark
            , border = darker
            }
        , link =
            { background = transparent
            , text = red
            , border = darker
            }
        , blue =
            { background = blue
            , text = white
            , border = blue
            }
        , red =
            { background = red
            , text = white
            , border = dark
            }
        , greyBackground =
            { background = lightCharcoal
            , text = dark
            , border = darker
            }
        , navigation =
            { background = lightGrey
            , text = lightCharcoal
            , border = darker
            }
        , navigationHover =
            { background = lightGrey
            , text = red
            , border = darker
            }
        , button =
            { border = darkBlue
            , background = blue
            , text = white
            }
        , searchBar =
            { background = Color.grey
            , text = Color.charcoal
            , border = Color.lightGrey
            }
        , searchBarFocused =
            { background = Color.white
            , text = Color.lightCharcoal
            , border = Color.lightGrey
            }
        }



--------------------
-- Define Base Style
--------------------


base : Style.Model Class
base =
    Style.foundation
        |> colors palette.normal
        |> font fontPalette.body.normal
        |> transition
            { property = "all"
            , duration = 300
            , easing = "ease-out"
            , delay = 0
            }


type Class
    = Nav
    | Centered
    | Container
    | Article
    | Sidebar
    | P
    | Link
    | Navlink
    | Header
    | Box
    | Smallbox


stylesheet : Style.StyleSheet Class msg
stylesheet =
    Style.debugWith [ Style.autoImportGoogleFonts ]
        [ classWith Nav base
            |> colors palette.navigation
            |> width (percent 100)
            |> padding (leftRightAndTopBottom 30 15)
            |> positionBy screen
            |> topLeft 0 0
            |> zIndex 10
            |> minWidth (px 1000)
            |> flowRight
                { wrap = False
                , horizontal =
                    justify
                    -- this makes it so the children elements hug the sides.
                    -- Perfect for a nav with a right and left section
                , vertical = verticalCenter
                }
        , classWith Centered base
            |> spacing (all 10)
            |> property "text-align" "center"
            |> flowRight
                { wrap = True
                , horizontal = alignCenter
                , vertical = alignTop
                }
        , classWith Container base
            |> padding (topBottom 100)
            |> minWidth (px 1000)
            |> flowLeft
                { wrap = True
                , horizontal = alignCenter
                , vertical = alignTop
                }
        , classWith Article base
            |> width (px 700)
            |> padding (all 20)
            |> spacing (all 40)
        , classWith Sidebar base
            |> width (px 300)
            |> padding (all 20)
            |> spacing (topBottom 40)
        , classWith P base
            |> spacing (all 20)
        , classWith Link base
            |> colors palette.link
            |> underline
            |> cursor "pointer"
        , classWith Navlink base
            |> padding (left 20)
            |> colors palette.navigation
            |> hover
                (\style ->
                    style
                        |> colors palette.navigationHover
                        |> cursor "pointer"
                )
        , classWith Header base
            |> font fontPalette.body.huge
        , classWith Box base
            |> width (px 180)
            |> height (px 180)
            |> padding (all 20)
            |> colors palette.blue
            |> flowRight
                { wrap = True
                , horizontal = alignCenter
                , vertical = verticalCenter
                }
        , classWith Smallbox base
            |> width (px 120)
            |> height (px 120)
            |> padding (all 20)
            |> colors palette.blue
            |> flowRight
                { wrap = True
                , horizontal = alignCenter
                , vertical = verticalCenter
                }
        ]


red : Style.Model -> Style.Model
red model =
    model
        |> colors palette.red


bordered : Style.Model -> Style.Model
bordered model =
    model
        |> borderWidth (all 5)
        |> borderRadius (all 15)


searchBar : Style.Model
searchBar =
    base
        |> width (px 250)
        |> padding (leftRightAndTopBottom 10 5)
        |> colors palette.searchBar
        |> borderWidth (all 1)
        |> borderStyle solid
        |> borderRadius (all 3)
        |> focus
            (colors
                { background = Color.white
                , text = Color.lightCharcoal
                , border = Color.lightGrey
                }
            )


br : Html msg
br =
    Html.br [] []



-------------------
-- Table Creation
-------------------


table : Style.Model
table =
    Style.empty
        |> tableLayout


{-| -}
row : Style.Model
row =
    Style.empty


{-| -}
tableHeader : Style.Model
tableHeader =
    Style.empty
        |> padding (all 10)
        |> borderStyle solid
        |> borderWidth (all 1)
        |> borderRadius (all 0)


{-| -}
cell : Style.Model
cell =
    Style.empty
        |> padding (all 10)
        |> borderStyle solid
        |> borderWidth (all 1)
        |> borderRadius (all 0)


button : Style.Model
button =
    base
        |> padding (leftRightAndTopBottom 30 15)
        |> borderStyle solid
        |> borderWidth (all 0)
        |> borderRadius (all 2)
        |> colors palette.button
        |> shadows
            [ shadow
                { offset = ( 0, 2 )
                , blur = 5
                , size = 0
                , color = Color.rgba 0 0 0 0.26
                }
            ]
        |> hover
            (levitate >> cursor "pointer")


rotatingBox : Style.Model
rotatingBox =
    base
        |> colors palette.button
        |> width (px 50)
        |> height (px 50)
        |> animate
            { duration = (5 * second)
            , easing = "linear"
            , repeat = forever
            , steps =
                [ ( 0, transforms [ rotate 0 0 0 ] )
                , ( 100, transforms [ rotate 0 0 (2 * pi) ] )
                ]
            }


subtleLevitate : Style.Model
subtleLevitate =
    base
        |> colors palette.button
        |> width (px 50)
        |> height (px 50)
        |> shadows
            [ shadow
                { offset = ( 0, 2 )
                , blur = 5
                , size = 0
                , color = Color.rgba 0 0 0 0.26
                }
            ]
        |> hover levitate


{-| To make the styles for the media queries we provide a function that takes the parent style and make the new style.

-}
mediaQueryExample : Style.Model
mediaQueryExample =
    let
        paintRed : Style.Model -> Style.Model
        paintRed model =
            model
                |> colors palette.red

        makeBordered : Style.Model -> Style.Model
        makeBordered model =
            model
                |> borderWidth (all 5)
                |> borderRadius (all 15)
    in
        base
            |> width (px 180)
            |> height (px 180)
            |> padding (all 20)
            |> colors palette.blue
            |> flowRight
                { wrap = True
                , horizontal = alignCenter
                , vertical = verticalCenter
                }
            |> media
                [ Style.Media.phoneOnly paintRed
                , Style.Media.tabletPortraitOnly makeBordered
                ]



---------------
-- Text Markup
--
-- These are defined as basic html and not as elements because we want them to be context aware
-- (i.e. we want the parent to decide what font to use).
-- Instead of having a unique italics element for everywhere we want italics, we can just have one which will use the fontsize/properties of the elements around it.
--
-- The class "inline" means that it will ignore the spacing set for it by the parent.  This is generally desired for inline elements.
---------------


hr : Style.Model
hr =
    base
        |> height (px 1)
        |> width (percent 100)
        |> colors palette.greyBackground
        |> inline


{-| Italicize text
-}
em : Style.Model
em =
    base
        |> inline
        |> italicize


{-| Bold text
-}
strong : Style.Model
strong =
    base
        |> inline
        |> bold


{-| Strike-through text
-}
strikeThrough : Style.Model
strikeThrough =
    base
        |> inline
        |> strike



-- Animations


levitate : Style.Model -> Style.Model
levitate model =
    model
        |> shadows
            [ shadow
                { offset = ( 0, 4 )
                , blur = 5
                , size = 0
                , color = Color.rgba 0 0 0 0.26
                }
            ]
        |> transforms
            [ translate 0 -2 0
            ]


{-| -}
forever : Float
forever =
    1.0 / 0
