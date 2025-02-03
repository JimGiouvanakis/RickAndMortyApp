//
//  AppViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 24/1/25.
//

import Foundation

//@MainActor
//class AppViewModel: ObservableObject {
//    
//    let useCase = UseCase()
//    //
//    //    //    @Injected(\.getEpisodeUseCase) private var getEpisodeUseCase: getEpisodeUseCaseProtocol
//    //
//    @Published var urls: MainAPI = MainAPI(characters: "", locations: "", episodes: "")
//    //    @Published var episodes: [EpisodeItem] = []
//    //    @Published var episodeInfo: Info = Info(count: 0, pages: 0, next: "", prev: "")
//    //
//    //
//    //    private var imageURL: String = "https://rickandmortyapi.com/api/character/avatar/"
//    //    private var imageURLEnding: String =  ".jpeg"
//    //
//    func setup() async {
//        await getData()
//    }
//    //
//    func getData() async {
//        let urls = await useCase.execute()
//        
//        self.urls = urls
//    }
//}
//
//    func getNewData(url: String) {
//        Task { await self.getEpisodeData(url: url) }
//    }
//    
//    func getEpisodeData(url: String) async {
//        
//        let episodes = await useCase.executeEpisodeData(url: url)
//        
//        guard let results = episodes.results else { return }
//        
//        self.episodes = results
//        
//        guard let info = episodes.info else { return }
//        
//        self.episodeInfo = info
//    }
//    
//    
//    
//    func getEpisodeCharacters(characters: [String]) -> [String] {
//        var episodeCharacters: [String] = []
//        
//        for character in characters {
//            let characterSplitURL = character.components(separatedBy: "/")
//            let newString = characterSplitURL[5]
//            let episodeCharacter = imageURL + newString + imageURLEnding
//            episodeCharacters.append(episodeCharacter)
//        }
//        return episodeCharacters
//    }
//    
//}
