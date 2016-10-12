module Main exposing (..)

{-|
-}

import Html exposing (Html)
import Html.App
import Elements exposing (..)


main : Program Never
main =
    Html.App.beginnerProgram
        { model = 0
        , view = view
        , update = (\_ _ -> 0)
        }


type alias Model =
    Int


view : Model -> Html msg
view model =
    centered []
        [ pirateContent []
            [ title [] [ text "Yar" ]
            , p []
                [ text "Prow scuttle parrel provost Sail ho shrouds spirits boom mizzenmast yardarm. "
                , b "Pinnace holystone mizzenmast"
                , text " quarter crow's nest nipperkin grog yardarm hempen halter furl. Swab barque interloper chantey "
                , i "doubloon starboard grog black jack gangway rutters."
                ]
            , p []
                [ floatLeft [] [ box [] [ text "We be afloat on the port side!" ] ]
                , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. Bring a spring upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                , floatRight [] [ box [] [ text "We be a-starboard now!" ] ]
                , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. Bring a spring upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                ]
            , title [] [ text "A Table of My Favorite Pirates" ]
            , table []
                [ row []
                    [ tableHeader [] [ text "Name" ]
                    , tableHeader [] [ text "Reason why favorite" ]
                    ]
                , row []
                    [ cell [] [ text "Metalbeard" ]
                    , cell [] [ text "beard" ]
                    ]
                , row []
                    [ cell [] [ text "Blackbeard" ]
                    , cell [] [ text "beard" ]
                    ]
                , row []
                    [ cell [] [ text "Redbeard" ]
                    , cell [] [ text "sense of humor" ]
                    ]
                ]
            , button []
                [ text "" ]
            ]
        , sidebar []
            [ title [] [ text "Sidebar" ]
            , text "Some text that I wish to be to the side of the pirate speak."
            ]
        ]
