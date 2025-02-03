//
//  EpisodesViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

@MainActor
class EpisodesViewModel: ObservableObject {
    
        let useCase = UseCase()
    
    private var imageURL: String = "https://rickandmortyapi.com/api/character/avatar/"
    private var imageURLEnding: String =  ".jpeg"
    
    @Published var episodes: [EpisodeItem] = []
    @Published var episodeInfo: Info = Info(count: 0, pages: 0, next: "", prev: "")
    
    
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
    
    func setup() async {
        await getData()
    }
    
    func getData() async {
        let urls = await useCase.execute()
        
        guard urls.episodes != "" else { return }
        
        await getEpisodeData(url: urls.episodes)
        
    }
    
    func getNewData(url: String) {
        Task { await self.getEpisodeData(url: url) }
    }
    
    func getEpisodeData(url: String) async {
        
        let episodes = await useCase.executeEpisodeData(url: url)
        
        guard let results = episodes.results else { return }
        
        self.episodes = results
        
        guard let info = episodes.info else { return }
        
        self.episodeInfo = info
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

extension EpisodesViewModel {
    
    static var placeholderEpisodeItem: [EpisodeItem] {
        (0..<5).map { _ in EpisodeItem (id: 0, name: "", air_date: "", episode: "", characters: [], url: "", created: "")} /// use this to secure that we generating unique IDs
    }
}
