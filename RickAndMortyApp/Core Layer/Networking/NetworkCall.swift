//
//  NetworkCall.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 21/1/25.
//

import Foundation
import SwiftUI

struct NetworkCall {
    
   
    
//    func fetchData(link: String) async throws -> Data {
    func fetchData() async throws -> Data {
        
        let url = URL(string: Constants.mainAPILink)!
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        return try await withCheckedThrowingContinuation { continuation in
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard error == nil else {
                    continuation.resume(throwing: NetworkError.generalError)
                    return
                }
                
                guard let httpResposne = response as? HTTPURLResponse, (200...299).contains(httpResposne.statusCode) else {
                    let statusError = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey : "Invalid response"])
                    continuation.resume(throwing: NetworkError.invalidResponse)
                    return
                }
                
                guard let data = data else {
                    let dataError = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                    continuation.resume(throwing: NetworkError.noData)
                    return
                }
                
                continuation.resume(returning: data)
                return
            }
            task.resume()
        }
    }
}
