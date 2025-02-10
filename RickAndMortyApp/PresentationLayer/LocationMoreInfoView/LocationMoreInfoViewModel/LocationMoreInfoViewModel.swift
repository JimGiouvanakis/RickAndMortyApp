//
//  LocationMoreInfoViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 10/2/25.
//

import Foundation

@MainActor
class LocationMoreInfoViewModel: ObservableObject {
    
    let useCase = UseCase()
    
    @Published var residents: [CharacterItem] = []
    
    func getCharacterEpisodesData(url: [String]) async {
        
        let residents = await useCase.executeEpisodeCharacters(url: url)
        
        self.residents = residents
    }
}


