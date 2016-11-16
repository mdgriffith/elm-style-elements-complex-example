module StyleSheet exposing (..)

import Style exposing (..)
import Style.Font
import Html exposing (Html)
import Html.Attributes
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
    , input : Style.ColorPalette
    , inputFocused : Style.ColorPalette
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
        , input =
            { background = Color.grey
            , text = Color.charcoal
            , border = Color.lightGrey
            }
        , inputFocused =
            { background = Color.white
            , text = Color.lightCharcoal
            , border = Color.lightGrey
            }
        }



--------------------
-- Define Base Style
--------------------


base : Style.Simple
base =
    Style.empty
        |> colors palette.normal
        |> font fontPalette.body.normal



--------------------
-- Define Elements
--------------------


nav : Element String msg
nav =
    Style.element
        (base
            |> colors palette.navigation
            |> width (percent 100)
            |> padding (leftRightAndTopBottom 30 15)
            |> relativeTo screen
            |> anchor topLeft
            |> position ( 0, 0 )
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
        )


centered : Element String msg
centered =
    Style.element
        (base
            |> spacing (all 10)
            |> flowRight
                { wrap = True
                , horizontal = alignCenter
                , vertical = alignTop
                }
        )


container : Element String msg
container =
    Style.element
        (base
            |> padding (topBottom 100)
            |> properties [ ( "min-width", "1000px" ) ]
            |> flowLeft
                { wrap = True
                , horizontal = alignCenter
                , vertical = alignTop
                }
        )


article : Element String msg
article =
    Style.elementAs "article"
        (base
            |> width (px 700)
            |> padding (all 20)
            |> spacing (all 40)
        )


sidebar : Element String msg
sidebar =
    Style.element
        (base
            |> width (px 300)
            |> padding (all 20)
            |> spacing (topBottom 40)
        )


p : Element String msg
p =
    elementAs "p" (base |> spacing (all 20))


link : Element String msg
link =
    elementAs "a"
        (base
            |> inline
            |> colors palette.link
        )


navLink : Element String msg
navLink =
    elementAs "a"
        (base
            |> inline
            |> padding (left 20)
            |> colors palette.navigation
            |> hover
                (\style ->
                    style
                        |> colors palette.navigationHover
                        |> cursor "pointer"
                )
        )


header : Element String msg
header =
    elementAs "header"
        (base
            |> font fontPalette.body.huge
        )


box : Style.Simple
box =
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


smallBox : Element String msg
smallBox =
    Style.element
        (base
            |> width (px 120)
            |> height (px 120)
            |> padding (all 20)
            |> colors palette.blue
            |> flowRight
                { wrap = True
                , horizontal = alignCenter
                , vertical = verticalCenter
                }
        )


red : Style.Simple -> Style.Simple
red model =
    model
        |> colors palette.red


bordered : Style.Simple -> Style.Simple
bordered model =
    model
        |> borderWidth (all 5)
        |> borderRadius (all 15)


input : Element String msg
input =
    Style.elementAs "input"
        (base
            |> width (px 250)
            |> padding (leftRightAndTopBottom 10 5)
            |> colors palette.input
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
        )



-------------------
-- Table Creation
-------------------


table : Style.Simple
table =
    Style.empty
        |> tableLayout


{-| -}
row : Style.Simple
row =
    Style.empty


{-| -}
tableHeader : Style.Simple
tableHeader =
    Style.empty
        |> padding (all 10)
        |> borderStyle solid
        |> borderWidth (all 1)
        |> borderRadius (all 0)


{-| -}
cell : Style.Simple
cell =
    Style.empty
        |> padding (all 10)
        |> borderStyle solid
        |> borderWidth (all 1)
        |> borderRadius (all 0)


button : Element String msg
button =
    Style.elementAs "button"
        (base
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
                (levitate
                    >> cursor "pointer"
                )
        )


rotatingBox : Element String msg
rotatingBox =
    Style.element
        (base
            |> colors palette.button
            |> width (px 50)
            |> height (px 50)
            |> Style.animate
                { duration = (5 * second)
                , easing = "linear"
                , repeat = forever
                , steps =
                    [ ( 0, transforms [ rotate 0 0 0 ] )
                    , ( 100, transforms [ rotate 0 0 (2 * pi) ] )
                    ]
                }
        )


subtleLevitate : Element String msg
subtleLevitate =
    Style.element
        (base
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
        )


{-| To make the styles for the media queries we provide a function that takes the parent style and make the new style.

-}
mediaQueryExample : Style.Simple
mediaQueryExample =
    let
        paintRed : Style.Simple -> Style.Simple
        paintRed model =
            model
                |> colors palette.red

        makeBordered : Style.Simple -> Style.Simple
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
                [ mediaQuery "screen and ( max-width: 700px )" paintRed
                , mediaQuery "screen and ( max-width: 600px )" makeBordered
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


hr : Element String msg
hr =
    elementAs "hr"
        (base
            |> height (px 1)
            |> width (percent 100)
        )



--{-| Italicize text
---}
--em : Style.Simple
--em =
--    italicize <| inline base
--{-| Bold text
---}
--strong : Style.Simple
--strong =
--    base
--        |> inline
--        |> bold
--{-| Strike-through text
---}
--strikeThrough : Style.Simple
--strikeThrough =
--    strike <| inline base
-- Animations


levitate : Style.Simple -> Style.Simple
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
