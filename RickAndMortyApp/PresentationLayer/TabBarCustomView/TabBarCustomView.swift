//
//  TabBarCustomView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 30/1/25.
//

import SwiftUI

struct TabBarCustomView: View {
    
    @Binding var selectedTab: TabBarSelections
    
    var body: some View {
        HStack(spacing: 15) {
            Button(action: {
                selectedTab = .episodes
            }) {
                ZStack {
                    if selectedTab == .episodes {
                        AnimatedRotationImageView()
                    }
                    
                    VStack {
                        Image(systemName: "tv")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle((selectedTab == .episodes) ? Color.App.tabBarSelectionGreen : Color.gray)
                            .bold()
                        
                        Text("Episodes")
                            .font(.system(size: 20))
                            .foregroundStyle((selectedTab == .episodes) ? Color.App.tabBarSelectionGreen : Color.gray)
                            .bold()
                    }
                }
            }
            .frame(width: 110, height: 60)
            .padding(10)
            
            Button(action: {
                    selectedTab = .locations
            }) {
                ZStack {
                    if selectedTab == .locations {
                        AnimatedRotationImageView()
                            }
                    
                    VStack {
                        Image(systemName: "map")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle((selectedTab == .locations) ? Color.App.tabBarSelectionGreen : Color.gray)
                            .bold()
                        
                        Text("Locations")
                            .font(.system(size: 20))
                            .foregroundStyle((selectedTab == .locations) ? Color.App.tabBarSelectionGreen : Color.gray)
                            .bold()
                    }
                }
            }
            .frame(width: 100, height: 60)
            
            Button(action: {
                selectedTab = .characters
            }) {
                ZStack {
                    if selectedTab == .characters {
                        AnimatedRotationImageView()
                    }
                    
                    VStack {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundStyle((selectedTab == .characters) ? Color.App.tabBarSelectionGreen : Color.gray)
                            .bold()
                        
                        Text("Characters")
                            .font(. system(size: 20))
                            .foregroundStyle((selectedTab == .characters) ? Color.App.tabBarSelectionGreen : Color.gray)
                            .bold()
                    }
                }
            }
            .frame(width: 110, height: 60)
            .padding(10)
        }
        .frame(width: 400)
    }    
}

//#Preview {
//    ContentView()
//}
