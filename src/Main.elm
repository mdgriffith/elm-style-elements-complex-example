module Main exposing (..)

{-|
-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onSubmit)
import MyStyles
import Layouts
import Layouts
import Style exposing (all)


main : Program Never Int Msg
main =
    Html.program
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


{ class, classList } =
    MyStyles.stylesheet


view : Model -> Html Msg
view model =
    div
        []
        [ Style.embed
            [ MyStyles.stylesheet
            , Layouts.stylesheet
            ]
        , nav [ class MyStyles.nav ]
            [ div []
                [ a
                    [ class MyStyles.navLink
                    , onClick WeDontDoAnythingHere
                    ]
                    [ text "All Things Pirate" ]
                ]
            , input
                [ class MyStyles.searchBar
                , placeholder "Pirate Search"
                , onSubmit WeDontDoAnythingHere
                ]
                []
            , Layouts.centered
                [ a
                    [ class MyStyles.navLink
                    , onClick WeDontDoAnythingHere
                    ]
                    [ text "Settings" ]
                , a
                    [ class MyStyles.navLink
                    , onClick WeDontDoAnythingHere
                    ]
                    [ text "Logged in as Smee" ]
                ]
            ]
        , div [ class MyStyles.container ]
            [ div [ class MyStyles.sidebar ]
                [ header [ class MyStyles.header ] [ text "Sidebar" ]
                , text "Yar, this website does nothin, except to show what pirate's care about most "
                , s [ class MyStyles.strikeThrough ] [ text "which be booty" ]
                , text " which be CSS and elm"
                ]
            , article [ class MyStyles.article ]
                [ header [ class MyStyles.header ] [ text "Yar" ]
                , p
                    [ class MyStyles.p ]
                    [ text "Prow scuttle parrel provost Sail ho shrouds spirits boom mizzenmast yardarm. "
                    , strong [] [ text "Pinnace holystone mizzenmast" ]
                    , text " quarter crow's nest nipperkin grog yardarm hempen halter furl. Swab barque interloper chantey "
                    , em [] [ text "doubloon starboard grog black jack gangway rutters." ]
                    ]
                , p
                    [ class MyStyles.p ]
                    [ Layouts.floatTopLeft
                        [ div
                            [ class MyStyles.box ]
                            [ text "We be afloat on the port side!" ]
                        ]
                    , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. Bring a spring upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                    , Layouts.floatRight
                        [ div
                            [ class MyStyles.box ]
                            [ text "We be a-starboard now!" ]
                        ]
                    , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. "
                    , a [ href "http://wise-manatee.com" ] [ text "Scallywag dance" ]
                    , text " upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. "
                    , text "Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                    ]
                , Layouts.centered
                    [ button
                        [ class MyStyles.button
                        , onClick WeDontDoAnythingHere
                        ]
                        [ text "Make 'em walk the plank!" ]
                    ]
                , hr [ class MyStyles.hr ] []
                , header
                    [ class MyStyles.header ]
                    [ text "Let's flow some boxes" ]
                , Layouts.centered
                    [ div [ class MyStyles.smallBox ] [ text "1" ]
                    , div [ class MyStyles.smallBox ] [ text "2" ]
                    , div [ class MyStyles.smallBox ] [ text "3" ]
                    ]
                , header [] [ text "And some animations" ]
                , Layouts.centered
                    [ div [ class MyStyles.base ]
                        [ Layouts.centered
                            [ div [ class MyStyles.rotatingBox ] [] ]
                        , text "rotating"
                        ]
                    , div [ class MyStyles.base ]
                        [ Layouts.centered
                            [ div [ class MyStyles.subtleLevitate ] []
                            ]
                        , text "subtle levitation"
                        , br [] []
                        , text "on hover"
                        ]
                    ]
                , header [ class MyStyles.header ] [ text "Perhaps a media query?" ]
                , Layouts.centered
                    [ div
                        [ class MyStyles.mediaQueryExample ]
                        [ text "resize the window to see this change!" ]
                    ]
                ]
            ]
        ]
