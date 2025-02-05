//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import SwiftUI

struct ContentView: View {
    
//    @StateObject var appViewModel = AppViewModel()
    @State var tabSelection: TabBarSelections = .episodes
    
    @State var selectedCharacter: CharacterItem?
    @State var showMoreInfo: Bool = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                if tabSelection == .episodes {
                    EpisodesView()
                } else if tabSelection == .locations {
                    LocationsView()
                } else if tabSelection == .characters {
                    CharactersView(showMoreInfo: $showMoreInfo, selectedCharacter: $selectedCharacter)
                }
                
                if let selectedCharacter {
                    NavigationLink(destination: CharacterMoreInfoView(character: selectedCharacter), isActive: $showMoreInfo) {
                        EmptyView()
                    }
                }
                
                TabBarCustomView(selectedTab: $tabSelection)
                    .ignoresSafeArea()
            }
            .ignoresSafeArea()
            .padding()
        }
    }
}

#Preview {
    SplashScreenView()
}
