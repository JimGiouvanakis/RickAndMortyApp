//
//  EpisodeMoreInforViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 10/2/25.
//

import Foundation

@MainActor
class EpisodeMoreInforViewModel: ObservableObject {
    
    let useCase = UseCase()

    @Published var episodeCharacters: [CharacterItem] = []

    func getCharacterEpisodesData(url: [String]) async {
        
        let episodeCharacters = await useCase.executeEpisodeCharacters(url: url)
        
        self.episodeCharacters = episodeCharacters
    }
}
