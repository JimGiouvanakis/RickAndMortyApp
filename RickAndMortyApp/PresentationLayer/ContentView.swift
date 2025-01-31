//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import SwiftUI

struct ContentView: View {
    
//    @StateObject var appViewModel = AppViewModel()
    @StateObject var appViewModel: AppViewModel
    @State var tabSelection: TabBarSelections = .episodes
    
    
    var body: some View {
        
        VStack {
                
            if tabSelection == .episodes {
                EpisodesView(episodes: appViewModel.episodes,episodeInfo: appViewModel.episodeInfo)
            } else if tabSelection == .locations {
                LocationsView(url: appViewModel.urls.characters)
            } else if tabSelection == .characters {
                CharactersView(url: appViewModel.urls.locations)
            }
            
            TabBarCustomView(selectedTab: $tabSelection)
                .ignoresSafeArea()
        }
        .ignoresSafeArea()
        .padding()
    }
}

#Preview {
    SplashScreenView()
}
