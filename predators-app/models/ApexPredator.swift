//
//  ApxPredator.swift
//  predators-app
//
//  Created by Julian González on 16/02/26.
//

import Foundation
import SwiftUI

struct ApexPredator: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: APType
    let latitude, longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, type, latitude, longitude, movies
        case movieScenes = "movie_scenes"
        case link
    }
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    
}

struct MovieScene: Decodable {
    let id: Int
    let movie: String
    let sceneDescription: String
    
    enum CodingKeys: String, CodingKey {
        case id, movie
        case sceneDescription = "scene_description"
    }
}

enum APType: String, Decodable, CaseIterable, Identifiable {
    case all
    case land
    case air
    case sea
    
    var id: APType {
        self
    }
    
    var backgroundColor: Color {
        switch self {
            case .air: .teal
            case .land: .brown
            case .sea: .blue
            case .all: .black
        }
    }
    
    var icon: String {
        switch self {
            case .all: "square.stack.3d.up.fill"
            case .land: "leaf.fill"
            case .air: "wind"
            case .sea: "drop.fill"
        }
    }
}
