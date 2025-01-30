//
//  EpisodesView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import SwiftUI

struct EpisodesView: View {
    
    @StateObject var viewModel = EpisodesViewModel()
    
    @State var episodes: [Episode]
    
    var body: some View {
        VStack {
            ForEach(episodes, id: \.id) { episode in
                Text(episode.name)
            }
            
        }
    }
}

#Preview {
    SplashScreenView()
}
