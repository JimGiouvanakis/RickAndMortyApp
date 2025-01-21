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
}


struct OriginAndLocation: Codable {
    var name: String
    var url: String
}
