//
//  UseCase.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct UseCase {
    let repository = Repository()
    
    func execute() async  -> MainAPI {
        let urls = await repository.getData()
        return urls
    }
    
    func executeEpisodeData(url: String) async  -> EpisodeDomainModel {
        let episodes = await repository.getEpisodesData(url: url)
        return episodes
    }
    
    func executeLocationData(url: String) async  -> LocationDomainModel {
        let locations = await repository.getLocationData(url: url)
        return locations
    }
    
    func executeCharacterData(url: String) async  -> CharacterDomainModel {
        let characters = await repository.getCharactersData(url: url)
        return characters
    }
    
    func executeCharacterEpisodesData(url: [String]) async  -> [EpisodeItem] {
        let character = await repository.getCharacterEpisodesData(url: url)
        return character
    }
    
    func executeCharacterLocationData(url: String) async  -> LocationItem {
        let character = await repository.getCharacterLocationData(url: url)
        return character
    }
    
    func executeEpisodeCharacters(url: [String]) async  -> [CharacterItem] {
        let characters = await repository.getEpisodeCharactersData(url: url)
        return characters
    }
    
    
//    func executeEpisodeCharacterData(url: String) async  -> Character {
//        let character = await repository.getEpisodeCharacterData(url: url)
//        return character
//    }
    
}
