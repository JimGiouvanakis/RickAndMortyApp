//
//  RemoteImageView.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 5/2/25.
//

import Foundation
import SwiftUI
import Kingfisher

struct RemoteImageView: View {
        let url: URL?
        
        var body: some View {
            
            KFImage.url(url)
                .resizable()
                .placeholder {
                    ProgressView()
                }

        }
    }
