//
//  CharactersView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import SwiftUI

struct CharactersView: View {
    
    @StateObject var viewModel = CharactersViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.characters, id: \.id) { character in
                Text(character.name)
            }
        }
        .onAppear {
            Task { await viewModel.setup()}
        }
    }
}
