//
//  CharacterMoreInfoViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 5/2/25.
//

import Foundation

@MainActor
class CharacterMoreInfoViewModel: ObservableObject {
    
    let useCase = UseCase()

    @Published var characterEpisodes: [EpisodeItem] = []
    
    @Published var characterOriginLocation: LocationItem = LocationItem(id: 0, name: "", type: "", dimension: "", residents: [], url: "", created: "")
    
    @Published var characterLocation: LocationItem = LocationItem(id: 0, name: "", type: "", dimension: "", residents: [], url: "", created: "")

    func getCharacterEpisodesData(url: [String]) async {
        
        let characterEpisodes = await useCase.executeCharacterEpisodesData(url: url)
        
        self.characterEpisodes = characterEpisodes
    }
    
    func getCharacterLocationData(type: CharacterLocationType,url: String) async {
        
        let characterLocation = await useCase.executeCharacterLocationData(url: url)
        
        if type == .origin {
            self.characterOriginLocation = characterLocation
        } else if type == .location {
            self.characterLocation = characterLocation
        }
    }
    
}
