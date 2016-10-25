module Main exposing (..)

{-|
-}

import Html exposing (Html)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onSubmit)
import Html.App
import MyElements exposing (..)


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
    page
        []
        [ nav []
            [ div []
                [ navlink [ onClick WeDontDoAnythingHere ] [ text "All Things Pirate" ]
                ]
            , input [ placeholder "Pirate Search", onSubmit WeDontDoAnythingHere ] []
            , div []
                [ navlink [ onClick WeDontDoAnythingHere ] [ text "Settings" ]
                , navlink [ onClick WeDontDoAnythingHere ] [ text "Logged in as Smee" ]
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
                    [ floatTopLeft <|
                        box [] [ text "We be afloat on the port side!" ]
                    , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. Bring a spring upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                    , floatRight <|
                        box [] [ text "We be a-starboard now!" ]
                    , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. "
                    , link [ href "http://wise-manatee.com" ] [ text "Scallywag dance" ]
                    , text " upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. "
                    , text "Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                    ]
                , header [] [ text "A Table of My Favorite Pirates" ]
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
                , centered []
                    [ button [ onClick WeDontDoAnythingHere ]
                        [ text "Make 'em walk the plank!" ]
                    ]
                , divider
                , header [] [ text "Let's flow some boxes" ]
                , centered []
                    [ smallBox [] [ text "1" ]
                    , smallBox [] [ text "2" ]
                    , smallBox [] [ text "3" ]
                    ]
                , header [] [ text "Now lets do some style variations" ]
                , centered []
                    [ boxVariations [ ( red, False ), ( bordered, False ) ] [] []
                    , boxVariations [ ( red, True ), ( bordered, False ) ] [] []
                    , boxVariations [ ( red, True ), ( bordered, True ) ] [] []
                    ]
                , header [] [ text "And some animations" ]
                , centered []
                    [ div []
                        [ centered []
                            [ rotatingBox [] [] ]
                        , text "rotating"
                        ]
                    , div []
                        [ centered []
                            [ subtleLevitate [] [] ]
                        , text "subtle levitation"
                        , br
                        , text "on hover"
                        ]
                    ]
                , header [] [ text "Perhaps a media query?" ]
                , centered []
                    [ mediaQueryExample [] [ text "resize the window to see this change!" ] ]
                ]
            ]
        ]
