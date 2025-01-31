//
//  Info.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 31/1/25.
//

import Foundation



struct Info: Identifiable, Equatable  {
    static func == (lhs: Info, rhs: Info) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id = UUID()
    var count: Int?
    var pages: Int?
    var next: String?
    var prev: String?
    
    init(
        count: Int,
        pages: Int,
        next: String,
        prev: String
    ) {
        self.count = count
        self.pages = pages
        self.next = next
        self.prev = prev
    }
    
    init(entity: InfoEntity?) {
        self.count = entity?.count ?? 0
        self.pages = entity?.pages ?? 0
        self.next = entity?.next ?? ""
        self.prev = entity?.prev ?? ""
    }
}
