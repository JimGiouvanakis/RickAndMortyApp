//
//  AppViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 24/1/25.
//

import Foundation

class AppViewModel: ObservableObject {
    
    let useCase = UseCase()
    
    func getUrls() async {
        let urls = await useCase.execute()
        
        guard let urls = urls else { return }
        
        
        
        if urls == nil {
            print("No data")
        } else {
            print(urls)
        }
    }
    
}
