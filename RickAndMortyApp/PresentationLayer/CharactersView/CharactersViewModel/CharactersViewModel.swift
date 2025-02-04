//
//  CharactersViewModel.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 30/1/25.
//

import Foundation

@MainActor
class CharactersViewModel: ObservableObject {
    
    let useCase = UseCase()

    @Published var characters: [CharacterItem] = []
    @Published var charactersInfo: Info = Info(count: 0, pages: 0, next: "", prev: "")

    func setup() async {
        await getData()
    }
    
    func getData() async {
        let urls = await useCase.execute()
        
        guard urls.characters != "" else { return }
        
        await getCharactersData(url: urls.characters)
        
    }
    
    func getNewData(url: String) {
        Task { await self.getCharactersData(url: url) }
    }
    
    func getCharactersData(url: String) async {
        
        let characters = await useCase.executeCharacterData(url: url)
        
        guard let results = characters.results else { return }
        
        self.characters = results
        
        guard let info = characters.info else { return }
        
        self.charactersInfo = info
    }
}
