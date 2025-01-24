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
    var status: String
    var species: String
    var type: String
    var gender: String
    var origin: OriginAndLocation
    var location: OriginAndLocation
    var image : String
    var episodes: [String]
    var url: String
    var created: String
    
    
    init(
        id: Int,
        name: String,
        status: String,
        species: String,
        type: String,
        gender: String,
        origin: OriginAndLocation,
        location: OriginAndLocation,
        image: String,
        episodes: [String],
        url: String,
        created: String
    ) {
        self.id = id
        self.name = name
        self.status = status
        self.species = species
        self.type = type
        self.gender = gender
        self.origin = origin
        self.location = location
        self.image = image
        self.episodes = episodes
        self.url = url
        self.created = created
    }
    
    init(entity: EpisodeResultsEntity) {
        self.id = entity.id ?? 0
        self.name = entity.name ?? ""
        self.status = entity.status ?? ""
        self.species = entity.species ?? ""
        self.type = entity.type ?? ""
        self.gender = entity.gender ?? ""
        self.origin = .init(entity: entity.origin)
        self.location = .init(entity: entity.location)
        self.image = entity.image ?? ""
        self.episodes = entity.episodes ?? ""
        self.url = entity.url ?? ""
        self.created = entity.created ?? ""
    }
}


struct OriginAndLocation: Codable {
    var name: String
    var url: String
}
