//
//  LocationItem.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 3/2/25.
//

import Foundation

struct LocationItem: Identifiable, Equatable  {
    static func == (lhs: LocationItem, rhs: LocationItem) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: Int
    var name: String
    var type: String
    var dimension: String
    var residents: [String]
    var url: String
    var created: String
    
    init(
        id: Int,
        name: String,
        type: String,
        dimension: String,
        residents: [String],
        url: String,
        created: String
    ) {
        self.id = id
        self.name = name
        self.type = type
        self.dimension = dimension
        self.residents = residents
        self.url = url
        self.created = created
    }
    
    init(entity: LocationResultEntity) {
        self.id = entity.id ?? 0
        self.name = entity.name ?? ""
        self.type = entity.type ?? ""
        self.dimension = entity.dimension ?? ""
        self.residents = entity.residents ?? []
        self.url = entity.url ?? ""
        self.created = entity.created ?? ""
    }
}
