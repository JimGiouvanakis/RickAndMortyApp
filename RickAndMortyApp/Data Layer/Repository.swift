//
//  Repository.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct Repository {
    
    let api =  API()
    
    func getData() async -> APIEntity? {
        do {
            let result = try await api.getData()
            return result
        } catch let authErrors as NSError {
                print(authErrors)
            return nil
            }
    }
    
    func getEpisodeData() async -> [EpisodeEntity]? {
        do {
            let result = try await api.getEpisodeData()
            return result
        } catch let authErrors as NSError {
                print(authErrors)
            return nil
            }
    }
    
    private func mapRsponseToDomaineEpisode(model: [EpisodeEntity]) -> [Episode] {
        var episodes: [Episode] = []
        for item in model {
            episodes.append(.init(entity: item))
        }
        return nft
    }
    
}
