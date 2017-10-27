module Graph exposing (..)

import Dict exposing (Dict)
import Set exposing (Set)

graph : Dict String (List String)

graph = Dict.fromList
    [ ("Bob", ["Sue", "Tom"])
    , ("Sue", ["Tom"])
    , ("Tom", [])
    ]

countFollowers : String -> Dict String (List String) -> Int
countFollowers name graph =
    let addFollow _ follows count =
        if List.member name follows then
            count + 1
        else
            count
    in
        Dict.foldl addFollow 0 graph

modules : Dict String (List String)
modules = Dict.fromList
    [ ("Home", ["Dict", "List"])
    , ("Profile", ["Dict", "Result"])
    , ("Dict", ["List"])
    , ("Result", ["Maybe"])
    , ("List", ["Maybe"])
    ]

findDeps : String -> Dict String (List String) -> List String
findDeps root graph =
    findDepsHelp Set.empty [root] graph

findDepsHelp : Set String -> List String -> Dict String (List String) -> List String
findDepsHelp visited unvisited graph =
    case unvisited of
        [] ->
            Set.toList visited
        next :: rest ->
            if Set.member next visited then
               findDepsHelp visited rest graph
            else
                let
                    newVisited = Set.insert next visited
                    nextDeps = Maybe.withDefault [] (Dict.get next graph)
                    newUnvisited = nextDeps ++ rest
                in
                    findDepsHelp newVisited newUnvisited graph
