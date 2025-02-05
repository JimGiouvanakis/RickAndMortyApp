//
//  CharacterMoreInfoView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 5/2/25.
//

import SwiftUI

struct CharacterMoreInfoView: View {
    
    @State var character: CharacterItem
    
    @StateObject var viewModel = CharacterMoreInfoViewModel()
    
    @StateObject var appViewModel = AppViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                RemoteImageView(url: appViewModel.getImageURL(url: character.image))
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8)
                    .clipShape(.rect(cornerRadius: 25))
                    .background (
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.App.episodeTextBlue, lineWidth: 4)
                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8)
                            .shadow(color: Color.App.episodeTextBlue, radius: 10, x: 5, y: 5)
                    )
                HStack {
                    Image(systemName: "person.crop.square")
                    
                    Text(character.name)
                    }
                
                HStack {
                    Image(systemName: "dot.radiowaves.left.and.right")
                   
                    Text(character.gender)
                }
                
                HStack {
                    if character.status == "Alive" {
                        Image(systemName: "person.crop.circle.fill.badge.xmark")
                    } else if character.status == "Dead"{
                        Image(systemName: "person.crop.circle.fill.badge.xmark")
                    } else {
                        Image(systemName: "person.crop.circle.badge.questionmark.fill")
                        
                    }
                   
                    Text(character.status)
                }
                
                HStack {
                    if character.status == "Human" {
                        Image(systemName: "person.fill")
                    } else if character.status == "Alien"{
                        Image(systemName: "antenna.radiowaves.left.and.right")
                    } else {
                        Image(systemName: "person.crop.circle.badge.questionmark.fill")
                        
                    }
                   
                    Text(character.species)
                }
                
                
                
                
                Text(character.type)
                
                HStack {
                    Text(character.origin.name)
                    
                    Text(viewModel.characterOriginLocation.dimension)
                }
                
                HStack {
                    Text(character.location.name)
                    
                    Text(viewModel.characterLocation.type)
                }
                
                ForEach(viewModel.characterEpisodes, id: \.id) { episode in
                    Text(episode.name)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.getCharacterEpisodesData(url: character.episode)
                await viewModel.getCharacterLocationData(type: .location, url: character.location.url)
                await viewModel.getCharacterLocationData(type: .origin, url: character.origin.url)
            }
        }
    }
}

#Preview {
    CharacterMoreInfoView(character: CharacterItem(id: 0, name: "Rick Sanchez", status: "Alive", species: "Human", type:"",gender:"Male",origin:OriginAndLocation(name:"Earth(C-137)",url:"https://rickandmortyapi.com/api/location/1"),location: OriginAndLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2","https://rickandmortyapi.com/api/episode/3"], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z"))
}
