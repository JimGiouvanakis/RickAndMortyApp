//
//  LocationViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 30/1/25.
//

import Foundation

class LocationViewModel: ObservableObject {
 
        let useCase = UseCase()

        @Published var locations: [Location] = []
    
        func setup() async {
            await getData(url: Constants.mainAPILink)
        }

        private func getData(url: String) async {
            let locations = await useCase.executeLocationData(url: url)
            self.locations = locations
        }
    
}
