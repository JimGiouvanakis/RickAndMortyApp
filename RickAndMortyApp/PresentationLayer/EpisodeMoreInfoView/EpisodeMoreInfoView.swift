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
        VStack {
            makeHeaderButtons()
            
            ScrollView {
                
                Text(episode.name)
                    .font(.system(size: 40))
                    .bold()
                    .foregroundStyle(Color.App.episodeBackgroundGreen)
                
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name:")
                                .font(.system(size: 15))
                                .opacity(0.7)
                            
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
                        
                        Text("Characters Present in the Episode:")
                            .font(.system(size: 15))
                            .opacity(0.5)
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
                    .foregroundColor(Color.App.episodeBackgroundGreen)
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
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
    
    @ViewBuilder
    func makeHeaderButtons() -> some View {
        HStack {
            Button {
                appCoordinator.pop(1)
            } label: {
                HStack(spacing: 5) {
                    Image(systemName: "chevron.backward")
                        .resizable()
                        .frame(width: 10, height: 10)
                        .foregroundColor(Color.App.tabBarSelectionGreen)
                    
                    Text("Go Back")
                        .font(.system(size: 20))
                        .foregroundColor(Color.App.tabBarSelectionGreen)
                }
            }
            
            Spacer()
            
            Button {
                appCoordinator.popToRoot()
            } label: {
                HStack(spacing: 5) {
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(Color.App.tabBarSelectionGreen)
                    
                    Text("Go Home")
                        .font(.system(size: 20))
                        .foregroundColor(Color.App.tabBarSelectionGreen)
                }
            }
        }
        .bold()
        .padding()
    }
}

#Preview {
    EpisodeMoreInfoView(episode: EpisodeItem(id: 0, name: "Pilot", air_date: "December 2,2013", episode: "SO1E01", characters: ["https://rickandmortyapi.com/api/character/179","https://rickandmortyapi.com/api/character/394","https://rickandmortyapi.com/api/character/12"], url: "https://rickandmortyapi.com/api/episode/1", created: "2017-11-10T12:56:33.798Z"))
}
