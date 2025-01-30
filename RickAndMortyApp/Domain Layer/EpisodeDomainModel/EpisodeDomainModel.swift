//
//  EpisodeDomainModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct Episode: Identifiable, Equatable  {
    static func == (lhs: Episode, rhs: Episode) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: Int
    var name: String
    var air_date: String
    var episode: String
    var characters: [String]
    var url: String
    var created: String
    
    init(
        id: Int,
        name: String,
        air_date: String,
        episode: String,
        characters: [String],
        url: String,
        created: String
    ) {
        self.id = id
        self.name = name
        self.air_date = air_date
        self.episode = episode
        self.characters = characters
        self.url = url
        self.created = created
    }
    
    init(entity: EpisodeResultsEntity) {
        self.id = entity.id ?? 0
        self.name = entity.name ?? ""
        self.air_date = entity.air_date ?? ""
        self.episode = entity.episode ?? ""
        self.characters = entity.characters ?? []
        self.url = entity.url ?? ""
        self.created = entity.created ?? ""
    }
}
