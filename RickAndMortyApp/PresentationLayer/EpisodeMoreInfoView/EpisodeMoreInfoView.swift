//
//  EpisodeMoreInfoView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 10/2/25.
//

import SwiftUI

struct EpisodeMoreInfoView: View {
    
    @StateObject var viewModel = EpisodeMoreInforViewModel()
    
    @StateObject var appViewModel = AppViewModel()
    
    @State var episode: EpisodeItem
    
    @Environment(\.appCoordinator) var appCoordinator: AppCoordinator
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    HStack {
                        Text("Name:")
                            .font(.system(size: 15))
                            .opacity(0.5)
                        
                        Text(episode.name)
                            .font(.system(size: 20))
                    }
                    .padding(.top)
                    
                    HStack {
                        Text("Air Date:")
                            .font(.system(size: 15))
                            .opacity(0.5)
                        
                        Text(episode.air_date)
                            .font(.system(size: 20))
                    }
                    .padding(.top)
                    
                    HStack {
                        Text("Episode:")
                            .font(.system(size: 15))
                            .opacity(0.5)
                        
                        Text(episode.episode)
                            .font(.system(size: 20))
                    }
                    .padding(.top)
                    
                    LazyVGrid(columns: columns) {
                        ForEach(viewModel.episodeCharacters, id: \.id) { character in
                            CharacterCardView(character: character)
                                .onTapGesture {
                                    appCoordinator.push(page: .character(character: character))
                                }
                        }
                    }
                }
                .padding()
                
                Spacer()
                Image("ImageTest2")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height * 0.4)
            }
            .onAppear {
                Task {
                    await viewModel.getCharacterEpisodesData(url: episode.characters)
                }
            }
        }
    }
}

#Preview {
    EpisodeMoreInfoView(episode: EpisodeItem(id: 0, name: "Pilot", air_date: "December 2,2013", episode: "SO1E01", characters: ["https://rickandmortyapi.com/api/character/179","https://rickandmortyapi.com/api/character/394","https://rickandmortyapi.com/api/character/12"], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z"))
}
