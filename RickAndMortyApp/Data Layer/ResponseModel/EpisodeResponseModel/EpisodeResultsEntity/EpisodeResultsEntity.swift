//
//  EpisodeResultsEntity.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 24/1/25.
//

import Foundation

struct EpisodeResultsEntity: Codable {
    var id: Int?
    var name: String?
    var air_date: String?
    var episode: String?
    var characters: [String]?
    var url: String?
    var created: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case air_date = "air_date"
        case episode = "episode"
        case characters = "characters"
        case url = "url"
        case created = "created"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        id = try? values?.decodeIfPresent(Int.self, forKey: .id)
        name = try? values?.decodeIfPresent(String.self, forKey: .name)
        air_date = try? values?.decodeIfPresent(String.self, forKey: .air_date)
        episode = try? values?.decodeIfPresent(String.self, forKey: .episode)
        characters = try? values?.decodeIfPresent([String].self, forKey: .characters)
        url = try? values?.decodeIfPresent(String.self, forKey: .url)
        created = try? values?.decodeIfPresent(String.self, forKey: .created)
    }
}
