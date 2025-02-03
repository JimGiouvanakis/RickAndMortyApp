//
//  Enums.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

enum NetworkError: Error {
    case generalError
    case invalidUrl
    case invalidResponse
    case noData
    case degodingError
}

enum TabBarSelections {
    case characters
    case episodes
    case locations
}
