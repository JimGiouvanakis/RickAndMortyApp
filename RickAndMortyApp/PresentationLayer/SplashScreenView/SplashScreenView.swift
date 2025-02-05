//
//  SplashScreenView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import SwiftUI

struct SplashScreenView: View {
    
    @State private var isActive = false
    @State private var size = 0.6
    @State private var opacity = 0.5
    
//    @StateObject var appViewModel = AppViewModel()
    
    var body: some View {
        
        if isActive {
            AppCoordinatorView()
        } else {
            VStack {
                VStack(spacing: 0) {
                    
                    Image("SplashImage")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.3)
                    
                    
                    Image("SplashTextImage")
                        .resizable()
                        .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.3)
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity  = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
