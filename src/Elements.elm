module Elements exposing (..)

import Html exposing (Html)
import Style exposing (..)
import Style.Elements exposing (element, elementAs, build)
import Style.Elements.Basic
import Color


--------------------
-- Define Base Style
--------------------


base : Style.Model
base =
    { empty
        | colors =
            { background = Color.rgba 255 255 255 0
            , text = Color.rgb 17 17 17
            , border = Color.rgb 230 230 230
            }
        , text =
            { font = "'Noto Sans', Georgia"
            , size = 18
            , lineHeight = 1.7
            , characterOffset = Nothing
            , italic = False
            , boldness = Nothing
            , align = alignLeft
            , decoration = Nothing
            , whitespace = normal
            }
    }



--------------------
-- Define Elements
--------------------
-- container


centered : List (Html.Attribute a) -> List (Element a) -> Html a
centered =
    let
        style =
            Style.Elements.Basic.centered
    in
        build { style | padding = topBottom 100 }


pirateContent : List (Html.Attribute a) -> List (Element a) -> Element a
pirateContent =
    element
        { base
            | width = px 500
            , padding = all 20
            , spacing = all 40
            , layout =
                textLayout
        }


sidebar : List (Html.Attribute a) -> List (Element a) -> Element a
sidebar =
    element
        { base
            | width = px 200
            , padding = all 20
            , spacing = topBottom 40
            , layout =
                textLayout
        }


p : List (Html.Attribute a) -> List (Element a) -> Element a
p =
    elementAs "p"
        { base | spacing = all 20 }


title : List (Html.Attribute a) -> List (Element a) -> Element a
title =
    elementAs "h1"
        { base
            | text =
                { font = "'Noto Sans', Georgia"
                , size = 24
                , lineHeight = 1.4
                , characterOffset = Nothing
                , italic = False
                , boldness = Nothing
                , align = alignLeft
                , decoration = Nothing
                , whitespace = normal
                }
        }


box : List (Html.Attribute a) -> List (Element a) -> Element a
box =
    element
        { base
            | width = px 180
            , height = px 180
            , padding = all 20
            , colors =
                { background = Color.blue
                , text = Color.white
                , border = Color.rgb 230 230 230
                }
        }


floatLeft : List (Html.Attribute a) -> List (Element a) -> Element a
floatLeft =
    element
        { base
            | float = Just Style.floatLeftTop
        }


floatRight : List (Html.Attribute a) -> List (Element a) -> Element a
floatRight =
    element
        { base
            | float = Just Style.floatRight
        }


text : String -> Element msg
text =
    Style.Elements.Basic.text


i : String -> Element msg
i =
    Style.Elements.Basic.i


b : String -> Element msg
b =
    Style.Elements.Basic.b


line : Element msg
line =
    Style.Elements.Basic.line


break : Element msg
break =
    Style.Elements.Basic.break


dottedList : List (Html.Attribute a) -> List (Element a) -> Element a
dottedList =
    Style.Elements.Basic.dottedList


numberedList : List (Html.Attribute a) -> List (Element a) -> Element a
numberedList =
    Style.Elements.Basic.numberedList



-------------------
-- Table Creation
-------------------


{-| -}
table : List (Html.Attribute msg) -> List (Element msg) -> Element msg
table =
    elementAs "table"
        { empty
            | layout = Style.tableLayout
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
            , border =
                { style = solid
                , width = all 1
                , corners = all 0
                }
        }


{-| -}
cell : List (Html.Attribute msg) -> List (Element msg) -> Element msg
cell =
    elementAs "td"
        { empty
            | padding = all 10
            , border =
                { style = solid
                , width = all 1
                , corners = all 0
                }
        }


{-| -}
button : List (Html.Attribute msg) -> List (Element msg) -> Element msg
button =
    elementAs "button" empty
