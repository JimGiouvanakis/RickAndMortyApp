//
//  CharacterResponseModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct CharactersEntity: Codable {
    var info: InfoEntity?
    var results: [CharactersResultsEntity]?
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        info = try? values?.decodeIfPresent(InfoEntity.self, forKey: .info)
        results = try? values?.decodeIfPresent([CharactersResultsEntity].self, forKey: .results)
    }
}
