//
//  LocationResultEntity.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 30/1/25.
//

import Foundation

struct LocationResultEntity: Codable {
    
    var id: Int?
    var name: String?
    var type: String?
    var dimension: String?
    var residents: [String]?
    var url: String?
    var created: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case type = "type"
        case dimension = "dimension"
        case residents = "residents"
        case url = "url"
        case created = "created"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        id = try? values?.decodeIfPresent(Int.self, forKey: .id)
        name = try? values?.decodeIfPresent(String.self, forKey: .name)
        type = try? values?.decodeIfPresent(String.self, forKey: .type)
        dimension = try? values?.decodeIfPresent(String.self, forKey: .dimension)
        residents = try? values?.decodeIfPresent([String].self, forKey: .residents)
        url = try? values?.decodeIfPresent(String.self, forKey: .url)
        created = try? values?.decodeIfPresent(String.self, forKey: .created)
    }
}
