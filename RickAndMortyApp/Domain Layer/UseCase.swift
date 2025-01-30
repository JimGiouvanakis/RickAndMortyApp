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
    
    func executeEpisodeData() async  -> [Episode] {
//        guard let episodes = await repository.getEpisodeData() else { return nil }
        let episodes = await repository.getEpisodesData() 
        return episodes
    }
}
