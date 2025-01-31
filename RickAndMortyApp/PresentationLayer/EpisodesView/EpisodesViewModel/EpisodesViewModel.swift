//
//  EpisodesViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

class EpisodesViewModel: ObservableObject {
    
//        let useCase = UseCase()
    
    private var imageURL: String = "https://rickandmortyapi.com/api/character/avatar/"
    private var imageURLEnding: String =  ".jpeg"
    
    func getEpisodeCharacters(characters: [String]) -> [String] {
        var episodeCharacters: [String] = []
        
        for character in characters {
        let characterSplitURL = character.components(separatedBy: "/")
        let newString = characterSplitURL[5]
        let episodeCharacter = imageURL + newString + imageURLEnding
            episodeCharacters.append(episodeCharacter)
        }
        return episodeCharacters
    }
    
    
    //    @Published var episodes: [Episode] = []
    //    func setup(url: String) async {
    //        await getData(url: url)
    //    }
    //
//        private func getData(url: String) async {
//            let episodes = await useCase.executeEpisodeData(url: url)
////            self.episodes = episodes
//        }
    
    //    func setupEpisodeCharacters(url: String) -> Character {
    //        getEpisodeCharacters(url: url)
    //        return self.episodeCharacter
    //    }
    
    //    private func getEpisodeCharacters(url: String) {
    //        Task {
    //            let episodeChar = await useCase.executeEpisodeCharacterData(url: url)
    //            self.episodeCharacter = episodeChar
    //        }
    //    }
    
}
