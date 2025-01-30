//
//  LocationsView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import SwiftUI

struct LocationsView: View {
    
    var url: String
    
    @StateObject var viewModel = LocationViewModel()
    
    var body: some View {
        VStack {
            ForEach(viewModel.locations, id: \.id) { location in
                Text(location.name)
            }
        }
        .onAppear {
            Task { await viewModel.setup(url: url)}
        }
    }
}

//#Preview {
//    ContentView()
//}
