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
    
    
    func getUrls() async {
        let urls = await useCase.execute()
//        self.urls  = await useCase.execute()
                
        self.urls = urls
//        
//        
//        if urls == nil {
//            print("No data")
//        } else {
//            print(urls)
//        }
    }
    
}
