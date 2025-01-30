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
    
    func executeEpisodeData(url: String) async  -> [Episode] {
        let episodes = await repository.getEpisodesData(url: url)
        return episodes
    }
    
    func executeLocationData(url: String) async  -> [Location] {
        let locations = await repository.getLocationData(url: url)
        return locations
    }
    
    func executeCharacterData(url: String) async  -> [Character] {
        let characters = await repository.getCharactersData(url: url)
        return characters
    }
    
}
