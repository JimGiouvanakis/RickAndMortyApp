//
//  LocationMoreInfoView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 10/2/25.
//

import SwiftUI

struct LocationMoreInfoView: View {
    
    @StateObject var viewModel = LocationMoreInfoViewModel()
    
    @State var location: LocationItem
    
    @Environment(\.appCoordinator) var appCoordinator: AppCoordinator
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
        
        VStack {
            
            makeHeaderButtons()
            
            ScrollView {
                
                Text(location.name)
                    .font(.system(size: 40))
                    .bold()
                    .foregroundStyle(Color.App.episodeBackgroundGreen)
                
                VStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name:")
                                .font(.system(size: 15))
                                .opacity(0.7)
                            
                            Text(location.name)
                                .font(.system(size: 20))
                        }
                        .padding(.top)
                        
                        HStack {
                            Text("Type:")
                                .font(.system(size: 15))
                                .opacity(0.5)
                            
                            Text(location.type)
                                .font(.system(size: 20))
                        }
                        .padding(.top)
                        
                        HStack {
                            Text("Dimension:")
                                .font(.system(size: 15))
                                .opacity(0.5)
                            
                            Text(location.dimension)
                                .font(.system(size: 20))
                        }
                        .padding(.top)
                        
                        Text("Residents of the planet:")
                            .font(.system(size: 15))
                            .opacity(0.5)
                            .padding(.top)
                        
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.residents, id: \.id) { character in
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
                    
                    Image("LocationImage")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.8, height:UIScreen.main.bounds.height * 0.4)
                }
            }
            .ignoresSafeArea(.all, edges: .bottom)
            .onAppear {
                Task {
                    await viewModel.getCharacterEpisodesData(url: location.residents)
                }
            }
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
    LocationMoreInfoView(location: LocationItem(id: 0, name: "Earth (C-137)", type: "Planet", dimension: "Dimension C-137", residents: ["https://rickandmortyapi.com/api/character/127","https://rickandmortyapi.com/api/character/1","https://rickandmortyapi.com/api/character/12"], url: "https://rickandmortyapi.com/api/location/1", created: "2017-11-10T12:42:04.162Z"))
}
