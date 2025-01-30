//
//  API.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct API {
    
    func getData() async -> APIEntity? {
        
        do {
            let data = try await NetworkCall().fetchData(link: Constants.mainAPILink)
            
            return try JSONDecoder().decode(APIEntity.self, from: data)
        } catch {
            print(error)
            return nil
        }
        
    }
    
    func getEpisodeData() async -> EpisodeEntity? {
        
        do {
            let data = try await NetworkCall().fetchData(link: Constants.mainAPILink)
            
            return try JSONDecoder().decode(EpisodeEntity.self, from: data)
        } catch {
            print(error)
            return nil
        }
        
    }
    
    
    
    
}
