//
//  InfoEntity.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 24/1/25.
//

import Foundation

struct InfoEntity: Codable {
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
