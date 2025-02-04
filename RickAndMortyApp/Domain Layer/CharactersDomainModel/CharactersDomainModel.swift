//
//  CharactersDomainModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 30/1/25.
//

import Foundation

struct CharacterDomainModel:Identifiable, Equatable  {
    static func == (lhs: CharacterDomainModel, rhs: CharacterDomainModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var info: Info?
    var results: [CharacterItem]?
    
    init (
        info: Info,
        results: [CharacterItem]
    ) {
        self.info = info
        self.results = results
    }
    
    init(entity: CharactersEntity?) {
        self.info = .init(entity: entity?.info)
        self.results = entity?.results?.map { CharacterItem(entity: $0) }
    }
}


