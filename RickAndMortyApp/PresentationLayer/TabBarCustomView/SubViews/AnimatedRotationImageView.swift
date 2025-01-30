//
//  AnimatedRotationImageView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 30/1/25.
//

import SwiftUI

struct AnimatedRotationImageView: View {
    @State var rotation: Double = 0
    @State var imageName: String = "SelectionsBackground"
    
    @State private var size = 0.6
    @State private var opacity = 0.5
    
    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 120, height: 120)
            .rotationEffect(.degrees(rotation))
            .animation(Animation.linear(duration: 10).repeatForever(autoreverses: false), value: rotation)
            .scaleEffect(size)
            .opacity(opacity)
            .onAppear {
                rotation = 360
                withAnimation(.easeIn(duration: 0.5)) {
                    self.size = 0.9
                    self.opacity  = 1.0
                }
            }
    }
}

//#Preview {
//    ContentView()
//}
