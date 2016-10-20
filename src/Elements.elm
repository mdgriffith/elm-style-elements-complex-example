module Elements exposing (..)

import Html exposing (Html)
import Style exposing (..)
import Style.Elements exposing (element, elementAs, build)
import Style.Basic exposing (levitate)
import Style.Elements.Basic
import Color
import Time exposing (second)


--------------------
-- Define Palettes
--------------------


fonts : { normal : Style.Text, title : Style.Text, code : Style.Text }
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


{-| Defining all your colors in one place makes fixing color issues a breeze on apps with large style sheets.

-}
palette :
    { normal : Style.Colors
    , link : Style.Colors
    , blue : Style.Colors
    , red : Style.Colors
    , button : Style.Colors
    , navigation : Style.Colors
    , navigationHover : Style.Colors
    , input : Style.Colors
    , inputFocused : Style.Colors
    }
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
            , additional = [ ( "min-width", "1000px" ) ]
            , padding = leftRightAndTopBottom 30 15
            , relativeTo = screen
            , anchor = topLeft
            , position = ( 0, 0 )
            , additional = [ ( "z-index", "10" ) ]
            , layout = Style.Basic.split
        }


notice : String -> Element a
notice str =
    element
        base
        []
        [ Style.Elements.Basic.text str ]


container : List (Html.Attribute a) -> List (Element a) -> Element a
container =
    element
        { base
            | padding = topBottom 100
            , additional = [ ( "min-width", "1000px" ) ]
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
                Style.Basic.completelyCentered
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
                Style.Basic.completelyCentered
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
                Style.Basic.completelyCentered
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



-------------------
-- Table Creation
-------------------


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


rotating : List (Html.Attribute msg) -> List (Element msg) -> Element msg
rotating =
    element
        { empty
            | colors = palette.button
            , width = px 50
            , height = px 50
            , animations =
                [ Style.Basic.rotating (5 * second)
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
                Style.Basic.completelyCentered
            , media =
                [ mediaQuery "screen and ( max-width: 700px )" red
                , mediaQuery "screen and ( max-width: 600px )" bordered
                ]
        }
