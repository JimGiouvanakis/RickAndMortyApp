//
//  Repository.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct Repository {
    
    let api =  API()
    
    func getData() async -> MainAPI {
            let result =  await api.getData()
        
        guard let result else { return MainAPI(characters: "", locations: "", episodes: "") }
        
            return mapRsponseToDomaineMainAPI(model: result)
    }
    
    private func mapRsponseToDomaineMainAPI(model: APIEntity) -> MainAPI {
        return .init(entity: model)
    }
    
    
    func getEpisodesData() async -> [Episode] {
            let episodes = await api.getEpisodeData()
        
        guard let episodes else { return [] }
        
            return mapRsponseToDomaineEpisode(model: episodes)
    }
    
    private func mapRsponseToDomaineEpisode(model: EpisodeEntity) -> [Episode] {
        var episodes: [Episode] = []
        
        guard let results = model.results else { return episodes }
        
        for episode in results {
            episodes.append(.init(entity: episode))
        }
        return episodes
    }
    
}
