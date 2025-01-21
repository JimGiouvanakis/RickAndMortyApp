//
//  ContentView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import SwiftUI

struct ContentView: View {
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
                let data = try await API().getData(link: Constants.mainAPILink)
                print(data)
            }
        }
    }
}

#Preview {
    ContentView()
}
