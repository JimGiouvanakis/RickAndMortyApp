//
//  LocationDomainModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 30/1/25.
//

import Foundation

struct LocationDomainModel: Identifiable, Equatable  {
    static func == (lhs: LocationDomainModel, rhs: LocationDomainModel) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var info: Info?
    var results: [LocationItem]?
    
    init(
        info: Info,
        results: [LocationItem]
    ) {
        self.info = info
        self.results = results
    }
    
    init(entity: LocationEntity?) {
        self.info = .init(entity: entity?.info)
        self.results = entity?.results?.map { LocationItem(entity: $0) }
    }
}
