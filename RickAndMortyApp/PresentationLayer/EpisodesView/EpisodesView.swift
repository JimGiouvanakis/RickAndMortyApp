//
//  EpisodesView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import SwiftUI

struct EpisodesView: View {
    
    @StateObject var viewModel = EpisodesViewModel()
    
    @State private var readMoreTapped: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading,spacing: 20) {
                    HStack {
                        Text("Episodes")
                            .font(.system(size: 40))
                            .bold()
                            .foregroundStyle(Color.App.episodeBackgroundGreen)
                        
                        Spacer()
                        
                        Image("PicleRick")
                            .resizable()
                            .frame(width: UIScreen.main.bounds.width * 0.2, height: UIScreen.main.bounds.height * 0.1)
                    }
                    
                    ForEach(viewModel.episodes, id: \.id) { episode in
                        VStack(alignment: .leading) {
                            Text("Episode \(episode.episode)")
                                .font(.system(size: 20))
                                .bold()
                            
                            Text(episode.name)
                                .font(.system(size: 20))
                                .bold()
                            
                            Text("Aired on \(episode.air_date)")
                                .font(.system(size: 20))
                                .bold()
                            
                            
                            characterImage(characters: episode.characters)
                                .padding(.horizontal)
                        }
                        .foregroundColor(Color.App.episodeBackgroundGreen)
                        .padding(.leading,10)
                        .frame(width: UIScreen.main.bounds.width * 0.9 ,height: UIScreen.main.bounds.height * 0.2,alignment: .leading)
                        .background (
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.App.episodeTextWhite)
                                .cornerRadius(10)
                        )
                        
                    }
                }
                makePreviousNextButton()
            }
        }
            .onAppear {
                Task { await viewModel.setup() }
            }
        
    }
    
    
    @ViewBuilder
    func characterImage(characters: [String]) -> some View {
        let columns = [
            GridItem(.adaptive(minimum: 15))
        ]
        let numberOfCharacters = viewModel.getEpisodeCharacters(characters: characters)
        
        HStack() {
            LazyVGrid(columns: columns) {
                ForEach(numberOfCharacters.prefix(6), id: \.self) { url in
                    AsyncImage(url: URL(string: url)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 40, height: 40)
                    .clipShape(.rect(cornerRadius: 25))
                }
            }
            
            if numberOfCharacters.count > 7 {
                Text("and \(numberOfCharacters.count - 6) more")
                    .font(.system(size: 15))
                    .bold()
            }
        }
    }
    
    @ViewBuilder
    func makePreviousNextButton() -> some View {
        HStack(spacing: 30) {
            if viewModel.episodeInfo.prev != "" {
                Button {
                    if let prevPage = viewModel.episodeInfo.prev  {
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
            
            if viewModel.episodeInfo.next != "" {
                Button {
                    if let nextPage = viewModel.episodeInfo.next  {
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
}

#Preview {
    SplashScreenView()
}
