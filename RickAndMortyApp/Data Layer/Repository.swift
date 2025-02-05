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
    
    
    func getEpisodesData(url: String) async -> EpisodeDomainModel {
        let episodes = await api.getEpisodeData(url: url)
        
        guard let episodes else { return EpisodeDomainModel(info: Info(count: 0, pages: 0, next: "", prev: ""), results: []) }
        
            return mapResponseToDomaineEpisode(model: episodes)
    }
    
    private func mapResponseToDomaineEpisode(model: EpisodeEntity) -> EpisodeDomainModel {
//        var episodes: [EpisodeDomainModel] = []
        
        return .init(entity: model)

    }
    
    func getLocationData(url: String) async -> LocationDomainModel {
        let locations = await api.getLocationData(url: url)
        
        guard let locations else { return LocationDomainModel(info: Info(count: 0, pages: 0, next: "", prev: ""), results: []) }
        
            return mapResponseToDomaineLocation(model: locations)
    }
    
    private func mapResponseToDomaineLocation(model: LocationEntity) -> LocationDomainModel {
        
        return .init(entity: model)
    }
    
    func getCharactersData(url: String) async -> CharacterDomainModel {
        let characters = await api.getCharactersData(url: url)
        
        guard let characters else { return CharacterDomainModel(info: Info(count: 0, pages: 0, next: "", prev: ""), results: []) }
        
            return mapResponseToDomaineCharacters(model: characters)
    }
    
    private func mapResponseToDomaineCharacters(model: CharactersEntity) -> CharacterDomainModel {
        return .init(entity: model)
    }

    func getCharacterEpisodesData(url: [String]) async -> [EpisodeItem] {
        var array : [EpisodeItem] = []
        
        for characterEpisodeURL in url {
            let characterEpisode = await api.getCharacterEpisodesData(url: characterEpisodeURL)
            
            if let characterEpisode {
                let episodeItem = mapResponseToDomaineCharacterEpisode(model: characterEpisode)
                
                array.append(episodeItem)
            }
        }
        return array
    }
    
    private func mapResponseToDomaineCharacterEpisode(model: EpisodeResultsEntity) -> EpisodeItem {
        return .init(entity: model)
    }
    
    func getCharacterLocationData(url: String) async -> LocationItem {
            let characterLocation = await api.getCharacterLocationData(url: url)
        
        guard let characterLocation else { return LocationItem(id: 0, name: "", type: "", dimension: "", residents: [], url: "", created: "") }
            
                return mapResponseToDomaineCharacterEpisode(model: characterLocation)
    }
    
    private func mapResponseToDomaineCharacterEpisode(model: LocationResultEntity) -> LocationItem {
        return .init(entity: model)
    }
    
    
    
//    func getEpisodeCharacterData(url: String) async -> Character {
//        let character = await api.getEpisodeCharacterData(url: url)
//        
//        guard let character else
//        { return Character(id: 0, name: "", status: "", species: "", type: "", gender: "", origin: OriginAndLocation(name: "", url: ""), location: OriginAndLocation(name: "", url: ""), image: "", episode: [], url: "", created: "") }
//        
//            return mapResponseToDomaineEpisodeCharacter(model: character)
//    }
//    
//    private func mapResponseToDomaineEpisodeCharacter(model: CharactersResultsEntity) -> Character {
//        
//        return Character(entity: model)
//    }
}
