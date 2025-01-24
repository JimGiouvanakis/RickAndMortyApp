//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var appViewModel = AppViewModel()
    
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear() {
            Task {
                await appViewModel.getUrls()
            }
        }
    }
}

#Preview {
    ContentView()
}
