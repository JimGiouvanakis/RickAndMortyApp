//
//  API.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation

struct API {
    
    func getData() async -> APIEntity? {
        
        do {
            let data = try await NetworkCall().fetchData(link: Constants.mainAPILink)
            
            return try JSONDecoder().decode(APIEntity.self, from: data)
        } catch {
            print(error)
            return nil
        }
        
    }
    
    func getEpisodeData(url: String) async -> EpisodeEntity? {
        
        do {
            guard url != "" else { return nil }
            let data = try await NetworkCall().fetchData(link: url)
            
            return try JSONDecoder().decode(EpisodeEntity.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
    
    func getLocationData(url: String) async -> LocationEntity? {
        
        do {
            guard url != "" else { return nil }
            let data = try await NetworkCall().fetchData(link: url)
            
            return try JSONDecoder().decode(LocationEntity.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
    
    func getCharactersData(url: String) async -> CharactersEntity? {
        
        do {
            guard url != "" else { return nil }
            let data = try await NetworkCall().fetchData(link: url)
            
            return try JSONDecoder().decode(CharactersEntity.self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
    
    func getCharacterEpisodesData(url: String) async -> EpisodeResultsEntity? {
            do {
                guard url != "" else { return nil }
                
                let data = try await NetworkCall().fetchData(link: url)
                
                return try JSONDecoder().decode(EpisodeResultsEntity.self, from: data)
            } catch {
                print(error)
                return nil
            }
    }
    
    
    func getCharacterLocationData(url: String) async -> LocationResultEntity? {
            do {
                guard url != "" else { return nil }
                
                let data = try await NetworkCall().fetchData(link: url)
                
                return try JSONDecoder().decode(LocationResultEntity.self, from: data)
            } catch {
                print(error)
                return nil
            }
    }
    
//    func getEpisodeCharacterData(url: String) async -> CharactersResultsEntity? {
//        
//        do {
//            guard url != "" else { return nil }
//            let data = try await NetworkCall().fetchData(link: url)
//            
//            return try JSONDecoder().decode(CharactersResultsEntity.self, from: data)
//        } catch {
//            print(error)
//            return nil
//        }
//    }
}
