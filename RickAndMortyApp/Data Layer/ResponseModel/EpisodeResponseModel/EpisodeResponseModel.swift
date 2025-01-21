//
//  EpisodeResponseModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct EpisodeEntity: Codable {
    var info: Info?
    var results: [EpisodeEntityItem]?
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        info = try? values?.decodeIfPresent(Info.self, forKey: .info)
        results = try? values?.decodeIfPresent([EpisodeEntityItem].self, forKey: .results)
    }
}

struct Info: Codable {
    var count: Int?
    var pages: Int?
    var next: String?
    var prev: String?
    
    enum CodingKeys: String, CodingKey {
        case count = "count"
        case pages = "pages"
        case next = "next"
        case prev = "prev"
    }
    
    init(from decoder: Decoder) throws {
        let values = try? decoder.container(keyedBy: CodingKeys.self)
        count = try? values?.decodeIfPresent(Int.self, forKey: .count)
        pages = try? values?.decodeIfPresent(Int.self, forKey: .pages)
        next = try? values?.decodeIfPresent(String.self, forKey: .next)
        prev = try? values?.decodeIfPresent(String.self, forKey: .prev)
    }
    
    
}
