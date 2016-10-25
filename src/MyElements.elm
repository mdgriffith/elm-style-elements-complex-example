module MyElements exposing (..)

import Style exposing (..)
import Style.Elements exposing (element, elementAs, build)
import Html exposing (Html)
import Html.Attributes
import Color
import Time exposing (Time, second)


--------------------
-- Define Palettes
--------------------


type alias MyFonts =
    { normal : Style.Text
    , title : Style.Text
    , code : Style.Text
    }


fonts : MyFonts
fonts =
    let
        foundation =
            { font = "'Noto Sans', Georgia"
            , size = 18
            , lineHeight = 1.7
            , characterOffset = Nothing
            , align = alignLeft
            , whitespace = normal
            }
    in
        { normal = foundation
        , title =
            { foundation
                | size = 24
            }
        , code =
            { foundation
                | whitespace = pre
                , font = "Inconsolata, Courier"
                , lineHeight = 1
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
        foundation =
            { background = Color.rgba 255 255 255 0
            , text = Color.darkCharcoal
            , border = Color.rgb 230 230 230
            }

        blue =
            Color.rgb 12 148 200

        darkBlue =
            Color.rgb 7 111 151
    in
        { normal = foundation
        , link =
            { foundation
                | text = Color.red
            }
        , blue =
            { background = blue
            , text = Color.white
            , border = blue
            }
        , red =
            { background = Color.red
            , text = Color.white
            , border = Color.darkGrey
            }
        , navigation =
            { foundation
                | background = Color.lightGrey
                , text = Color.lightCharcoal
            }
        , navigationHover =
            { foundation
                | background = Color.lightGrey
                , text = Color.red
            }
        , button =
            { foundation
                | border = darkBlue
                , background = blue
                , text = Color.white
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


base : Style.Model
base =
    { empty
        | colors = palette.normal
        , text = fonts.normal
    }



--------------------
-- Define Elements
--------------------


{-| The absolute parent element.  This element will embed a style sheet and convert all elements to html.
-}
page : List (Html.Attribute a) -> List (Element a) -> Html a
page =
    build base


div : List (Html.Attribute a) -> List (Element a) -> Element a
div =
    element base


nav : List (Html.Attribute a) -> List (Element a) -> Element a
nav =
    elementAs "nav"
        { base
            | colors = palette.navigation
            , text = fonts.normal
            , width = percent 100
            , padding = leftRightAndTopBottom 30 15
            , relativeTo = screen
            , anchor = topLeft
            , position = ( 0, 0 )
            , properties = [ ( "z-index", "10" ), ( "min-width", "1000px" ) ]
            , layout =
                flowRight
                    { wrap = False
                    , horizontal =
                        justify
                        -- this makes it so the children elements hug the sides.
                        -- Perfect for a nav with a right and left section
                    , vertical = verticalCenter
                    }
        }


centered : List (Html.Attribute a) -> List (Element a) -> Element a
centered =
    element
        { base
            | spacing = all 10
            , layout =
                flowRight
                    { wrap = True
                    , horizontal = alignCenter
                    , vertical = alignTop
                    }
        }


notice : String -> Element a
notice str =
    element
        base
        []
        [ text str ]


container : List (Html.Attribute a) -> List (Element a) -> Element a
container =
    element
        { base
            | padding = topBottom 100
            , properties = [ ( "min-width", "1000px" ) ]
            , layout =
                flowLeft
                    { wrap = True
                    , horizontal = alignCenter
                    , vertical = alignTop
                    }
        }


article : List (Html.Attribute a) -> List (Element a) -> Element a
article =
    elementAs "article"
        { base
            | width = px 700
            , padding = all 20
            , spacing = all 40
        }


sidebar : List (Html.Attribute a) -> List (Element a) -> Element a
sidebar =
    element
        { base
            | width = px 300
            , padding = all 20
            , spacing = topBottom 40
        }


p : List (Html.Attribute a) -> List (Element a) -> Element a
p =
    elementAs "p"
        { base | spacing = all 20 }


link : List (Html.Attribute a) -> List (Element a) -> Element a
link =
    elementAs "a"
        { base
            | inline =
                True
            , colors = palette.link
        }


navlink : List (Html.Attribute a) -> List (Element a) -> Element a
navlink =
    elementAs "a"
        { base
            | inline = True
            , padding = left 20
            , colors = palette.navigation
            , animations =
                [ on hover
                    { variation
                        | colors = Just palette.navigationHover
                        , cursor = Just "pointer"
                    }
                ]
        }


header : List (Html.Attribute a) -> List (Element a) -> Element a
header =
    elementAs "h1"
        { base
            | text = fonts.title
        }


box : List (Html.Attribute a) -> List (Element a) -> Element a
box =
    element
        { base
            | width = px 180
            , height = px 180
            , padding = all 20
            , colors = palette.blue
            , layout =
                flowRight
                    { wrap = True
                    , horizontal = alignCenter
                    , vertical = verticalCenter
                    }
        }


smallBox : List (Html.Attribute a) -> List (Element a) -> Element a
smallBox =
    element
        { base
            | width = px 120
            , height = px 120
            , padding = all 20
            , colors = palette.blue
            , layout =
                flowRight
                    { wrap = True
                    , horizontal = alignCenter
                    , vertical = verticalCenter
                    }
        }


boxVariations : List ( Style.Variation, Bool ) -> List (Html.Attribute a) -> List (Element a) -> Element a
boxVariations =
    Style.Elements.optional
        { base
            | width = px 120
            , height = px 120
            , padding = all 20
            , colors = palette.blue
            , layout =
                flowRight
                    { wrap = True
                    , horizontal = alignCenter
                    , vertical = verticalCenter
                    }
        }


red : Style.Variation
red =
    { variation | colors = Just palette.red }


bordered : Style.Variation
bordered =
    { variation
        | borderWidth = Just <| all 5
        , cornerRadius = Just <| all 15
    }


input : List (Html.Attribute a) -> List (Element a) -> Element a
input =
    elementAs "input"
        { base
            | width = px 250
            , padding = leftRightAndTopBottom 10 5
            , colors =
                palette.input
            , borderStyle = solid
            , borderWidth = all 1
            , cornerRadius = all 3
            , animations =
                [ on focus
                    { variation
                        | colors =
                            Just
                                { background = Color.white
                                , text = Color.lightCharcoal
                                , border = Color.lightGrey
                                }
                    }
                ]
        }



-----------------------------------------
-- Convenience elements for setting float
-----------------------------------------


{-| Float a single element to the left
-}
floatLeft : Element a -> Element a
floatLeft floater =
    element
        { empty
            | float = Just Style.floatLeft
        }
        []
        [ floater ]


{-|
-}
floatRight : Element a -> Element a
floatRight floater =
    element
        { empty
            | float = Just Style.floatRight
        }
        []
        [ floater ]


{-| Float a single element to the left.  "topLeft" means it will ignore top spacing that the parent specifies and use 0px insteas.
-}
floatTopLeft : Element a -> Element a
floatTopLeft floater =
    element
        { empty
            | float = Just Style.floatTopLeft
        }
        []
        [ floater ]


{-|
-}
floatTopRight : Element a -> Element a
floatTopRight floater =
    element
        { empty
            | float = Just Style.floatTopRight
        }
        []
        [ floater ]



-------------------
-- Table Creation
-------------------


table : List (Html.Attribute msg) -> List (Element msg) -> Element msg
table =
    elementAs "table"
        { empty
            | layout = tableLayout
        }


{-| -}
row : List (Html.Attribute msg) -> List (Element msg) -> Element msg
row =
    elementAs "tr" empty


{-| -}
tableHeader : List (Html.Attribute msg) -> List (Element msg) -> Element msg
tableHeader =
    elementAs "th"
        { empty
            | padding = all 10
            , borderStyle = solid
            , borderWidth = all 1
            , cornerRadius = all 0
        }


{-| -}
cell : List (Html.Attribute msg) -> List (Element msg) -> Element msg
cell =
    elementAs "td"
        { empty
            | padding = all 10
            , borderStyle = solid
            , borderWidth = all 1
            , cornerRadius = all 0
        }


{-| -}
button : List (Html.Attribute msg) -> List (Element msg) -> Element msg
button =
    elementAs "button"
        { empty
            | padding = leftRightAndTopBottom 30 15
            , borderStyle = solid
            , borderWidth = all 0
            , cornerRadius = all 2
            , colors = palette.button
            , shadows =
                [ shadow
                    { offset = ( 0, 2 )
                    , blur = 5
                    , size = 0
                    , color = Color.rgba 0 0 0 0.26
                    }
                ]
            , animations =
                [ on hover
                    { levitate
                        | cursor = Just "pointer"
                    }
                ]
        }


rotatingBox : List (Html.Attribute msg) -> List (Element msg) -> Element msg
rotatingBox =
    element
        { empty
            | colors = palette.button
            , width = px 50
            , height = px 50
            , animations =
                [ rotating (5 * second)
                ]
        }


{-| -}
subtleLevitate : List (Html.Attribute msg) -> List (Element msg) -> Element msg
subtleLevitate =
    element
        { empty
            | colors = palette.button
            , width = px 50
            , height = px 50
            , shadows =
                [ shadow
                    { offset = ( 0, 2 )
                    , blur = 5
                    , size = 0
                    , color = Color.rgba 0 0 0 0.26
                    }
                ]
            , animations =
                [ on hover levitate
                ]
        }


mediaQueryExample : List (Html.Attribute a) -> List (Element a) -> Element a
mediaQueryExample =
    element
        { base
            | width = px 180
            , height = px 180
            , padding = all 20
            , colors = palette.blue
            , layout =
                flowRight
                    { wrap = True
                    , horizontal = alignCenter
                    , vertical = verticalCenter
                    }
            , media =
                [ mediaQuery "screen and ( max-width: 700px )" red
                , mediaQuery "screen and ( max-width: 600px )" bordered
                ]
        }



---------------
-- Text Markup
--
-- These are defined as basic html and not as elements because we want them to be context aware.
-- Instead of having a unique italics element for everywhere we want italics, we can just have one which will use the fontsize/properties of the elements around it.
--
-- The class "inline" means that it will ignore the spacing set for it by the parent.  This is generally desired for inline elements.
---------------


br : Element msg
br =
    Style.Elements.html <|
        Html.br [ Html.Attributes.class "inline" ] []


text : String -> Element msg
text str =
    Style.Elements.html <| Html.text str


{-| Italicize text
-}
i : String -> Element msg
i str =
    Style.Elements.html <|
        Html.i
            [ Html.Attributes.class "inline"
            ]
            [ Html.text str ]


{-| Bold text
-}
b : String -> Element msg
b str =
    Style.Elements.html <|
        Html.b
            [ Html.Attributes.class "inline"
            ]
            [ Html.text str ]


{-| Strike-through text
-}
s : String -> Element msg
s str =
    Style.Elements.html <|
        Html.s
            [ Html.Attributes.class "inline"
            ]
            [ Html.text str ]


{-| Underline text
-}
u : String -> Element msg
u str =
    Style.Elements.html <|
        Html.u
            [ Html.Attributes.class "inline"
            ]
            [ Html.text str ]


{-| Underline text
-}
sub : String -> Element msg
sub str =
    Style.Elements.html <|
        Html.sub
            [ Html.Attributes.class "inline"
            ]
            [ Html.text str ]


{-| Underline text
-}
sup : String -> Element msg
sup str =
    Style.Elements.html <|
        Html.sup
            [ Html.Attributes.class "inline"
            ]
            [ Html.text str ]


{-| A dividing line rendered as an 'hr' element
-}
divider : Element msg
divider =
    Style.Elements.html <|
        Html.hr
            [ Html.Attributes.style
                [ ( "height", "1px" )
                , ( "border", "none" )
                , ( "background-color", "#ddd" )
                ]
            , Html.Attributes.class "inline"
            ]
            []



-- Animations


{-| Rotate an element clockwise, forever.
 Provide the duration for one revolution.
-}
rotating : Time -> Animation
rotating durationForOneRevolution =
    Style.animate
        { duration = durationForOneRevolution
        , easing = "linear"
        , repeat = forever
        , steps =
            [ ( 0, { variation | transforms = [ rotate 0 0 0 ] } )
            , ( 100, { variation | transforms = [ rotate 0 0 (2 * pi) ] } )
            ]
        }


levitate : Variation
levitate =
    { variation
        | shadows =
            [ shadow
                { offset = ( 0, 4 )
                , blur = 5
                , size = 0
                , color = Color.rgba 0 0 0 0.26
                }
            ]
        , transforms =
            [ translate 0 -2 0
            ]
    }


{-| -}
forever : Float
forever =
    1.0 / 0
