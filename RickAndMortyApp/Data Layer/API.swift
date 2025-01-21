//
//  API.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct API {
    
    func getData(link: String) async throws -> APIEntity {
        
        do {
            let data = try await NetworkCall().fetchData(link: link)
            
            return try JSONDecoder().decode(APIEntity.self, from: data)
        } catch {
            print(error)
            throw error
        }
        
    }
    
}
