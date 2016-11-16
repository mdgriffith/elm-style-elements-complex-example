module Main exposing (..)

{-|
-}

import Html exposing (Html, div, text, br, strong, em)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onSubmit)
import StyleSheet exposing (..)
import Style


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


view : Model -> Html Msg
view model =
    div
        []
        [ Style.embed
            [ nav.style
            , container.style
            , centered.style
            , rotatingBox.style
            , subtleLevitate.style
            , article.style
            , link.style
            , smallBox.style
            , p.style
            ]
        , nav.el []
            [ div []
                [ link.el [ onClick WeDontDoAnythingHere ] [ text "All Things Pirate" ]
                ]
            , input.el [ placeholder "Pirate Search", onSubmit WeDontDoAnythingHere ] []
            , div []
                [ link.el [ onClick WeDontDoAnythingHere ] [ text "Settings" ]
                , link.el [ onClick WeDontDoAnythingHere ] [ text "Logged in as Smee" ]
                ]
            ]
        , container.el []
            [ div []
                [ header.el [] [ text "Sidebar" ]
                , text "Yar, this website does nothin, except to show what pirate's care about most"
                , br [] []
                , br [] []
                  --, div [ Style.class StyleSheet.strikeThrough ] [text "which be booty"]
                , br [] []
                , text "which be CSS and elm"
                ]
            , article.el []
                [ header.el [] [ text "Yar" ]
                , p.el []
                    [ text "Prow scuttle parrel provost Sail ho shrouds spirits boom mizzenmast yardarm. "
                    , strong [] [ text "Pinnace holystone mizzenmast" ]
                    , text " quarter crow's nest nipperkin grog yardarm hempen halter furl. Swab barque interloper chantey "
                    , em [] [ text "doubloon starboard grog black jack gangway rutters." ]
                    ]
                  --, p []
                  --    [ floatTopLeft <|
                  --        box [ Style.class StyleSheet.container ] [ text "We be afloat on the port side!" ]
                  --    , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. Bring a spring upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                  --    , floatRight <|
                  --        box [ Style.class StyleSheet.container ] [ text "We be a-starboard now!" ]
                  --    , text "Deadlights jack lad schooner scallywag dance the hempen jig carouser broadside cable strike colors. "
                  --    , a [ href "http://wise-manatee.com" ] [ text "Scallywag dance" ]
                  --    , text " upon her cable holystone blow the man down spanker Shiver me timbers to go on account lookout wherry doubloon chase. "
                  --    , text "Belay yo-ho-ho keelhaul squiffy black spot yardarm spyglass sheet transom heave to."
                  --    ]
                , header.el [] [ text "A Table of My Favorite Pirates" ]
                  --, table []
                  --    [ row []
                  --        [ tableHeader [] [ text "Name" ]
                  --        , tableHeader [] [ text "Reason why favorite" ]
                  --        ]
                  --    , row []
                  --        [ cell [] [ text "Metalbeard" ]
                  --        , cell [] [ text "beard" ]
                  --        ]
                  --    , row []
                  --        [ cell [] [ text "Blackbeard" ]
                  --        , cell [] [ text "beard" ]
                  --        ]
                  --    , row []
                  --        [ cell [] [ text "Redbeard" ]
                  --        , cell [] [ text "sense of humor" ]
                  --        ]
                  --    ]
                , centered.el []
                    [ button.el [ onClick WeDontDoAnythingHere ]
                        [ text "Make 'em walk the plank!" ]
                    ]
                , hr.el [] []
                , header.el [] [ text "Let's flow some boxes" ]
                , centered.el []
                    [ smallBox.el [] [ text "1" ]
                    , smallBox.el [] [ text "2" ]
                    , smallBox.el [] [ text "3" ]
                    ]
                  --, header [] [ text "Now lets do some style variations" ]
                  --, div [ Style.class StyleSheet.centered ]
                  --    [ boxVariations [ ( red, False ), ( bordered, False ) ] [] []
                  --    , boxVariations [ ( red, True ), ( bordered, False ) ] [] []
                  --    , boxVariations [ ( red, True ), ( bordered, True ) ] [] []
                  --    ]
                , header.el [] [ text "And some animations" ]
                , centered.el []
                    [ div []
                        [ centered.el []
                            [ rotatingBox.el [] [] ]
                        , text "rotating"
                        ]
                    , div []
                        [ centered.el []
                            [ subtleLevitate.el [] [] ]
                        , text "subtle levitation"
                        , br [] []
                        , text "on hover"
                        ]
                    ]
                , header.el [] [ text "Perhaps a media query?" ]
                , centered.el []
                    [ div [ Style.class StyleSheet.mediaQueryExample ] [ text "resize the window to see this change!" ] ]
                ]
            ]
        ]
