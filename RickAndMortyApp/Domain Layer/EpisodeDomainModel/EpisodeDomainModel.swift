//
//  EpisodeDomainModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct EpisodeDomainModel: Identifiable, Equatable  {
    static func == (lhs: EpisodeDomainModel, rhs: EpisodeDomainModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var info: Info?
    var results: [EpisodeItem]?
    
    init(
        info: Info,
        results: [EpisodeItem]
    ) {
        self.info = info
        self.results = results
    }
    
    init(entity: EpisodeEntity?) {
        self.info = .init(entity: entity?.info)
        self.results = entity?.results?.map { EpisodeItem(entity: $0) }
    }
}
