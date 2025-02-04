//
//  CharacterCardView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 4/2/25.
//

import SwiftUI

struct CharacterCardView: View {
    
    @State var character: CharacterItem
    
    var body: some View {
        AsyncImage(url: URL(string: character.image)) { image in
            image.resizable()
                .frame(width: 170, height: 200)
                .clipShape(.rect(cornerRadius: 25))
                .background (
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.App.cardDardGrayStroke, lineWidth: 4)
                        .frame(width: 170, height: 200)
                        .shadow(color: Color.App.cardDardGrayShadow, radius: 10, x: 5, y: 5)
                )
                .overlay(alignment: .bottom, content: {
                    Text("\(character.name)")
                        .font(.system(size: 16))
                        .foregroundColor(Color.App.white)
                        .padding(5)
                        .background(Color.App.cardDardGrayShadow.opacity(0.6))
                        .cornerRadius(8)
                    
                })
        } placeholder: {
            ProgressView()
        }
                    .padding(.vertical)
        
    }
}

//#Preview {
//    CharactersView()
//}
