//
//  API.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct API {
    
    func getData() async throws -> APIEntity {
        
        do {
            let data = try await NetworkCall().fetchData()
            
            return try JSONDecoder().decode(APIEntity.self, from: data)
        } catch {
            print(error)
            throw error
        }
        
    }
    
    func getEpisodeData() async throws -> [EpisodeEntity] {
        
        do {
            let data = try await NetworkCall().fetchData()
            
            return try JSONDecoder().decode([EpisodeEntity].self, from: data)
        } catch {
            print(error)
            throw error
        }
        
    }
    
    
    
    
}
