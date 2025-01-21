//
//  ResponseModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct APIEntity: Codable {
    
    var characters: String?
    var locations: String?
    var episodes: String?
    
    enum CodingKeys: String, CodingKey {
        case characters = "characters"
        case locations = "locations"
        case episodes = "episodes"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        characters = try? values?.decodeIfPresent(String.self, forKey: .characters)
        locations = try? values?.decodeIfPresent(String.self, forKey: .locations)
        episodes = try? values?.decodeIfPresent(String.self, forKey: .episodes)
    }
}


