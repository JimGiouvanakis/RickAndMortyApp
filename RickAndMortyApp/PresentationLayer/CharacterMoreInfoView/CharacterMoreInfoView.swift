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
    
    @Environment(\.appCoordinator) var appCoordinator: AppCoordinator
    
    let columns = [
        GridItem(.adaptive(minimum: 80))
    ]
    
    var body: some View {
        ScrollView {
            
            Text(character.name)
                .font(.system(size: 40))
                .bold()
                .foregroundStyle(Color.App.episodeBackgroundGreen)
            
            VStack(alignment: .leading) {
                RemoteImageView(url: appViewModel.getImageURL(url: character.image))
//                    .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8)
                    .clipShape(.circle)
                    .background (
                        Circle()
                            .stroke(Color.App.episodeBackgroundGreen, lineWidth: 4)
//                            .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.width * 0.8)
                            .shadow(color: Color.App.episodeBackgroundGreen, radius: 10, x: 5, y: 5)
                    )
                    .padding(.leading,20)
                    .accessibilityLabel("Image of \(character.name)")
                    .accessibilityRemoveTraits(.isImage)
                
                HStack {
                    Text("Gender:")
                        .font(.system(size: 15))
                        .opacity(0.5)
                    
                    Text(character.gender)
                        .font(.system(size: 20))
                }
                
                HStack {
                    Text("Status:")
                        .font(.system(size: 15))
                        .opacity(0.5)
                    
                    Text(character.status)
                        .font(.system(size: 20))
                }
                
                HStack {
                    Text("Species:")
                        .font(.system(size: 15))
                        .opacity(0.5)
                    
                    Text(character.species)
                        .font(.system(size: 20))
                }
                
                if character.type != "" {
                    HStack {
                        Text("Type:")
                            .font(.system(size: 15))
                            .opacity(0.5)
                        
                        Text(character.type)
                            .font(.system(size: 20))
                    }
                }
                
                HStack {
                    Text("Origin Planet:")
                        .font(.system(size: 15))
                        .opacity(0.5)
                    
                    Text(character.origin.name)
                        .font(.system(size: 20))
                }
                
                HStack {
                    Text("Last Location:")
                        .font(.system(size: 15))
                        .opacity(0.5)
                    
                    Text(character.location.name)
                        .font(.system(size: 20))
                }
                
                Text("Present in episodes:")
                    .font(.system(size: 15))
                    .opacity(0.5)
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.characterEpisodes, id: \.id) { episode in
                        Text(episode.episode)
                            .padding(10)
                            .foregroundColor(Color.App.white)
                            .background(Color.App.episodeBackgroundGreen)
                            .cornerRadius(20)
                            .onTapGesture {
                                appCoordinator.push(page: .episode(episode: episode))
                            }
                            .accessibilityAddTraits(.isButton)
                    }
                }
            }
            .foregroundColor(Color.App.episodeBackgroundGreen)
            .padding(.horizontal)
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
    CharacterMoreInfoView(character: CharacterItem(id: 0, name: "Rick Sanchez", status: "Alive", species: "Human", type:"Robot",gender:"Male",origin:OriginAndLocation(name:"Earth(C-137)",url:"https://rickandmortyapi.com/api/location/1"),location: OriginAndLocation(name: "Citadel of Ricks", url: "https://rickandmortyapi.com/api/location/3"), image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", episode: ["https://rickandmortyapi.com/api/episode/1","https://rickandmortyapi.com/api/episode/2","https://rickandmortyapi.com/api/episode/3"], url: "https://rickandmortyapi.com/api/character/1", created: "2017-11-04T18:48:46.250Z"))
}
