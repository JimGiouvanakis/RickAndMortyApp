//
//  UseCase.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct UseCase {
    let repository = Repository()
    
    func execute() async  -> APIEntity? {
        guard let urls = await repository.getData() else { return nil }
        return urls
    }
    
    func executeEpisodeData() async  -> [EpisodeEntity]? {
        guard let urls = await repository.getEpisodeData() else { return nil }
        return urls
    }
}
