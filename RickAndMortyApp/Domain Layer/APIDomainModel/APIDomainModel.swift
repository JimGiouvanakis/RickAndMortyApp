//
//  APIDomainModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 30/1/25.
//

import Foundation

struct MainAPI: Identifiable, Equatable  {
    static func == (lhs: MainAPI, rhs: MainAPI) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var characters: String
    var locations: String
    var episodes: String
    
    init(
        characters: String,
        locations: String,
        episodes: String
    ) {
        self.characters = characters
        self.locations = locations
        self.episodes = episodes
    }
    
    init(entity: APIEntity) {
        self.characters = entity.characters ?? ""
        self.locations = entity.locations ?? ""
        self.episodes = entity.episodes ?? ""
    }
}
