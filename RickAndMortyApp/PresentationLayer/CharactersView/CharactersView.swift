//
//  CharactersView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import SwiftUI


struct CharactersView: View {
    
    @StateObject var viewModel = CharactersViewModel()
    @Binding var showMoreInfo: Bool
    @Binding var selectedCharacter: CharacterItem?
    
    @Environment(\.appCoordinator) var appCoordinator: AppCoordinator
    
    let columns = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible(), spacing: 20)
    ]
    
    var body: some View {
            VStack {
                ScrollView {
                    VStack(spacing: 20) {
                        HStack {
                            Text("Characters")
                                .font(.system(size: 40))
                                .bold()
                                .foregroundStyle(Color.App.episodeBackgroundGreen)
                            
                            Spacer()
                            
                            Image("PicleRick")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                        }
                        
                        LazyVGrid(columns: columns) {
                            ForEach(viewModel.characters, id: \.id) { character in
                                CharacterCardView(character: character)
                                    .onTapGesture {
                                        appCoordinator.push(page: .character(character: character))
                                    }
                            }
                        }
                        //                        .sheet(isPresented: $showMoreInfo) {
                        //                            EmptyView()
                        //                        }
                        
                        makePreviousNextButton()
                    }
                }
            }
        .onAppear {
            Task { await viewModel.setup()}
        }
    }
    
    @ViewBuilder
    func makePreviousNextButton() -> some View {
        HStack(spacing: 30) {
            if viewModel.charactersInfo.prev != "" {
                Button {
                    if let prevPage = viewModel.charactersInfo.prev  {
                        viewModel.getNewData(url: prevPage)
                    }
                } label: {
                    Text("Previous")
                        .padding()
                        .font(.system(size: 30))
                        .bold()
                        .foregroundStyle(Color.App.episodeBackgroundGreen)
                        .overlay (
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.App.episodeBackgroundGreen, lineWidth: 3)
                        )
                        .padding(.trailing)
                        .padding(.bottom, 50)
                }
            }
            
            if viewModel.charactersInfo.next != "" {
                Button {
                    if let nextPage = viewModel.charactersInfo.next  {
                        viewModel.getNewData(url: nextPage)
                    }
                } label: {
                    Text("Next")
                        .padding()
                        .font(.system(size: 30))
                        .bold()
                        .foregroundStyle(Color.App.episodeBackgroundGreen)
                        .overlay (
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(Color.App.episodeBackgroundGreen, lineWidth: 3)
                        )
                    
                        .padding(.bottom, 50)
                }
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    func makePopUp() -> some View {
        VStack {
            Text("123")
                .frame(width: 100,height: 100)
                .overlay (
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.App.cardDardGrayStroke, lineWidth: 4)
                        .frame(width: 170, height: 200)
                        .shadow(color: Color.App.cardDardGrayShadow, radius: 10, x: 5, y: 5)
                )
        }
    }
}




#Preview {
    ContentView()
}
