//
//  ApxPredator.swift
//  predators-app
//
//  Created by Julian González on 16/02/26.
//

import Foundation

struct ApexPredator: Decodable {
    let id: Int
    let name: String
    let type: TypeEnum
    let latitude, longitude: Double
    let movies: [Movie]
    let movieScenes: [MovieScene]
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, type, latitude, longitude, movies
        case movieScenes = "movie_scenes"
        case link
    }
}

struct MovieScene: Decodable {
    let id: Int
    let movie: Movie
    let sceneDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id, movie
        case sceneDescription = "scene_description"
    }
}

enum Movie: String, Decodable {
    case jurassicPark = "Jurassic Park"
    case jurassicParkIII = "Jurassic Park III"
    case jurassicWorld = "Jurassic World"
    case jurassicWorldDominion = "Jurassic World: Dominion"
    case jurassicWorldFallenKingdom = "Jurassic World: Fallen Kingdom"
    case theLostWorldJurassicPark = "The Lost World: Jurassic Park"
}

enum TypeEnum: String, Decodable {
    case air = "air"
    case land = "land"
    case sea = "sea"
}
