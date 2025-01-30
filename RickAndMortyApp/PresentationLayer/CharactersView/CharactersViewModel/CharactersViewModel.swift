//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 30/1/25.
//

import Foundation

class CharactersViewModel: ObservableObject {
    
    let useCase = UseCase()

    @Published var characters: [Character] = []

    func setup(url: String) async {
        await getData(url: url)
    }

    private func getData(url: String) async {
        let characters = await useCase.executeCharacterData(url: url)
        self.characters = characters
    }
}
