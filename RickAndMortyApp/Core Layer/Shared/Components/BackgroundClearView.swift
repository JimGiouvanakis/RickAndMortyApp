//
//  BackgroundClearView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 5/2/25.
//

import SwiftUI

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}

