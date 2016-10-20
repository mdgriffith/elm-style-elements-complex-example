module Main exposing (..)

{-|
-}

import Html exposing (Html)
import Html.Attributes exposing (..)
import Html.Events
import Html.App
import Elements exposing (..)
import Style.Elements.Basic exposing (text, b, i, s, u, br)
import Style.Elements


main : Program Never
main =
    Html.App.program
        { init = 0 ! []
        , view = view
        , update = update
        , subscriptions = (\_ -> Sub.none)
        }


type alias Model =
    Int


type Msg
    = WeDontDoAnythingHere


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        WeDontDoAnythingHere ->
            let
                _ =
                    Debug.log "style-elements" "This website doesn't actually do anything..."
            in
                ( model, Cmd.none )


view : Model -> Html Msg
view model =
    Style.Elements.build base
        []
        [ nav []
            [ div []
                [ navlink [ Html.Events.onClick WeDontDoAnythingHere ] [ text "All Things Pirate" ]
                ]
            , input [ placeholder "Pirate Search", Html.Events.onSubmit WeDontDoAnythingHere ] []
            , div []
                [ navlink [ Html.Events.onClick WeDontDoAnythingHere ] [ text "Settings" ]
                , navlink [ Html.Events.onClick WeDontDoAnythingHere ] [ text "Logged in as Smee" ]
                ]
            ]
        , container []
            [ sidebar []
                [ header [] [ text "Sidebar" ]
                , text "Yar, this website does nothin, except to show what pirate's care about most"
                , br
                , br
                , s "which be booty"
                , br
                , text "which be CSS and elm"
                ]
            , article []
                [ header [] [ text "Yar" ]
                , p []
                    [ text "Prow scuttle parrel provost Sail ho shrouds spirits boom mizzenmast yardarm. "
                    , b "Pinnace holystone mizzenmast"
                    , text " quarter crow's nest nipperkin grog yardarm hempen halter furl. Swab barque interloper chantey "
                    , i "doubloon starboard grog black jack gangway rutters."
                    ]
                , p []
                    [ Style.Elements.Basic.floatTopLeft <|
                        box [] [ text "We be afloat on the port side!" ]
                    , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. Bring a spring upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                    , Style.Elements.Basic.floatRight <|
                        box [] [ text "We be a-starboard now!" ]
                    , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. "
                    , link [ href "http://wise-manatee.com" ] [ text "Scallywag dance" ]
                    , text " upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. "
                    , text "Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                    ]
                , header [] [ text "A Table of My Favorite Pirates" ]
                , Style.Elements.Basic.table []
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
                , Style.Elements.Basic.centered []
                    [ button [ Html.Events.onClick WeDontDoAnythingHere ]
                        [ text "Make 'em walk the plank!" ]
                    ]
                , Style.Elements.Basic.divider
                , header [] [ text "Let's flow some boxes" ]
                , Style.Elements.Basic.centered []
                    [ smallBox [] [ text "1" ]
                    , smallBox [] [ text "2" ]
                    , smallBox [] [ text "3" ]
                    ]
                , header [] [ text "Now lets do some style variations" ]
                , Style.Elements.Basic.centered []
                    [ boxVariations [ ( red, False ), ( bordered, False ) ] [] []
                    , boxVariations [ ( red, True ), ( bordered, False ) ] [] []
                    , boxVariations [ ( red, True ), ( bordered, True ) ] [] []
                    ]
                , header [] [ text "And some animations" ]
                , Style.Elements.Basic.centered []
                    [ div []
                        [ Style.Elements.Basic.centered []
                            [ rotating [] [] ]
                        , text "rotating"
                        ]
                    , div []
                        [ Style.Elements.Basic.centered []
                            [ subtleLevitate [] [] ]
                        , text "subtle levitation"
                        , br
                        , text "on hover"
                        ]
                    ]
                , header [] [ text "Perhaps a media query?" ]
                , Style.Elements.Basic.centered []
                    [ mediaQueryExample [] [ text "resize the window to see this change!" ] ]
                ]
            ]
        ]
