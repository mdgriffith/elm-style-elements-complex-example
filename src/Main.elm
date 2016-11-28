module Main exposing (..)

{-|
-}

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onSubmit)
import StyleSheet exposing (Class(..))
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
    StyleSheet.stylesheet


view : Model -> Html Msg
view model =
    div
        []
        [ Style.embed StyleSheet.stylesheet
        , Style.embed Layouts.stylesheet
        , nav [ class Nav ]
            [ div []
                [ a
                    [ class NavLink
                    , onClick WeDontDoAnythingHere
                    ]
                    [ text "All Things Pirate" ]
                ]
            , input
                [ class SearchBar
                , placeholder "Pirate Search"
                , onSubmit WeDontDoAnythingHere
                ]
                []
            , Layouts.centered
                [ a
                    [ class NavLink
                    , onClick WeDontDoAnythingHere
                    ]
                    [ text "Settings" ]
                , a
                    [ class NavLink
                    , onClick WeDontDoAnythingHere
                    ]
                    [ text "Logged in as Smee" ]
                ]
            ]
        , div [ class Container ]
            [ div [ class Sidebar ]
                [ header [ class Header ] [ text "Sidebar" ]
                , text "Yar, this website does nothin, except to show what pirate's care about most "
                , s [ class StrikeThrough ] [ text "which be booty" ]
                , text " which be CSS and elm"
                ]
            , article [ class Article ]
                [ header [ class Header ] [ text "Yar" ]
                , p
                    [ class P ]
                    [ text "Prow scuttle parrel provost Sail ho shrouds spirits boom mizzenmast yardarm. "
                    , strong [] [ text "Pinnace holystone mizzenmast" ]
                    , text " quarter crow's nest nipperkin grog yardarm hempen halter furl. Swab barque interloper chantey "
                    , em [] [ text "doubloon starboard grog black jack gangway rutters." ]
                    ]
                , p
                    [ class P ]
                    [ Layouts.floatTopLeft
                        [ div
                            [ class Box ]
                            [ text "We be afloat on the port side!" ]
                        ]
                    , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. Bring a spring upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                    , Layouts.floatRight
                        [ div
                            [ class Box ]
                            [ text "We be a-starboard now!" ]
                        ]
                    , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. "
                    , a [ href "http://wise-manatee.com" ] [ text "Scallywag dance" ]
                    , text " upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. "
                    , text "Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                    ]
                , Layouts.centered
                    [ button
                        [ class Button
                        , onClick WeDontDoAnythingHere
                        ]
                        [ text "Make 'em walk the plank!" ]
                    ]
                , hr [] []
                , header
                    [ class Header ]
                    [ text "Let's flow some boxes" ]
                , Layouts.centered
                    [ div [ class SmallBox ] [ text "1" ]
                    , div [ class SmallBox ] [ text "2" ]
                    , div [ class SmallBox ] [ text "3" ]
                    ]
                , header [] [ text "And some animations" ]
                , Layouts.centered
                    [ div [ class Base ]
                        [ Layouts.centered
                            [ div [ class RotatingBox ] [] ]
                        , text "rotating"
                        ]
                    , div [ class Base ]
                        [ Layouts.centered
                            [ div [ class SubtleLevitate ] []
                            ]
                        , text "subtle levitation"
                        , br [] []
                        , text "on hover"
                        ]
                    ]
                , header [ class Header ] [ text "Perhaps a media query?" ]
                , Layouts.centered
                    [ div
                        [ class MediaQueryExample ]
                        [ text "resize the window to see this change!" ]
                    ]
                ]
            ]
        ]
