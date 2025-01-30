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
        
            return mapResponseToDomaineMainAPI(model: result)
    }
    
    private func mapResponseToDomaineMainAPI(model: APIEntity) -> MainAPI {
        return .init(entity: model)
    }
    
    
    func getEpisodesData(url: String) async -> [Episode] {
        let episodes = await api.getEpisodeData(url: url)
        
        guard let episodes else { return [] }
        
            return mapResponseToDomaineEpisode(model: episodes)
    }
    
    private func mapResponseToDomaineEpisode(model: EpisodeEntity) -> [Episode] {
        var episodes: [Episode] = []
        
        guard let results = model.results else { return episodes }
        
        for episode in results {
            episodes.append(.init(entity: episode))
        }
        return episodes
    }
    
    func getLocationData(url: String) async -> [Location] {
        let locations = await api.getLocationData(url: url)
        
        guard let locations else { return [] }
        
            return mapResponseToDomaineLocation(model: locations)
    }
    
    private func mapResponseToDomaineLocation(model: LocationEntity) -> [Location] {
        var locations: [Location] = []
        
        guard let results = model.results else { return locations }
        
        for location in results {
            locations.append(.init(entity: location))
        }
        return locations
    }
    
    func getCharactersData(url: String) async -> [Character] {
        let characters = await api.getCharactersData(url: url)
        
        guard let characters else { return [] }
        
            return mapResponseToDomaineCharacters(model: characters)
    }
    
    private func mapResponseToDomaineCharacters(model: CharactersEntity) -> [Character] {
        var characters: [Character] = []
        
        guard let results = model.results else { return characters }
        
        for character in results {
            characters.append(.init(entity: character))
        }
        return characters
    }

    
    
    
    
}
