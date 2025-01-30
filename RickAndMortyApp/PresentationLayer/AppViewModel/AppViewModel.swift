//
//  AppViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 24/1/25.
//

import Foundation

@MainActor
class AppViewModel: ObservableObject {
    
    let useCase = UseCase()
    
    @Published var urls: MainAPI = MainAPI(characters: "", locations: "", episodes: "")
    @Published var episodes: [Episode] = []
    
    func setup() async {
        await getData()
    }
    
    func getData() async {
        let urls = await useCase.execute()
                
        self.urls = urls
        
        guard urls.episodes != "" else { return }
        
        let episodes = await useCase.executeEpisodeData(url: urls.episodes)
        
        self.episodes = episodes
    }
    
}
