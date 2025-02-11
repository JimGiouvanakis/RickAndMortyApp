//
//  AppCoordinator.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 5/2/25.
//

import Foundation
import SwiftUI

enum AppCoordinatorPage: Hashable, View {
    
    case home
    case character(character: CharacterItem)
    case episode(episode: EpisodeItem)
    case location(location: LocationItem)
    
    var body: some View {
        switch self {
        case .home:
            ContentView()
                .navigationBarBackButtonHidden(true)
        case .character(let character):
            CharacterMoreInfoView(character: character)
                .navigationBarBackButtonHidden(true)
        case .episode(let episode):
            EpisodeMoreInfoView(episode: episode)
                .navigationBarBackButtonHidden(true)
        case .location(let location):
            LocationMoreInfoView(location: location)
                .navigationBarBackButtonHidden(true)
        }
    }
}

extension EnvironmentValues {
    @Entry var appCoordinator = AppCoordinator()
}

@Observable
class AppCoordinator {
    var path: NavigationPath = NavigationPath()
    
    func push(page: AppCoordinatorPage) {
        path.append(page)
    }
    
    func pop(_ last: Int = 1) {
        path.removeLast(last)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

struct AppCoordinatorView: View {
    
    @State private var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
                AppCoordinatorPage.home
                    .navigationDestination(for: AppCoordinatorPage.self) { $0 }
                    
        }
        .environment(\.appCoordinator, coordinator)
    }
}
