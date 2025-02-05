//
//  OriginAndLocation.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 30/1/25.
//

import Foundation

struct OriginAndLocation: Hashable {
    
    let name: String
    let url: String
    
    init(name: String, url: String) {
        self.name = name
        self.url = url
    }
    
    init(entity: OriginAndLocationEntity?) {
        self.name = entity?.name ?? ""
        self.url = entity?.url ?? ""
    }
}
