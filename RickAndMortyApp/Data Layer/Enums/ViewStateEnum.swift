//
//  ViewStateEnum.swift
//  RickAndMortyApp
//
//  Created by Dimitris Giouvanakis on 3/2/25.
//

import Foundation

enum ViewStateEnum<T> {
    case idle(placeholder: T)
    case loading(placeholder: T)
    case loaded(T)
    case failed(Error, placeholder: T)
}

extension ViewStateEnum {
    var isLoading: Bool {
        get {
            switch self {
            case .idle, .loading:
                return true
            default:
                return false
            }
        }
        set { }
    }
}

extension ViewStateEnum {
    // NOTE: This implementation doesn't work as we want because of optional return
//    var data: T? {
//        get {
//            if case .loaded(let data) = self {
//                return data
//            }
//            return nil
//        }
//        set {
//            if let newData = newValue {
//                self = .loaded(newData)
//            }
//        }
//    }
    
    /// Computed property that returns the loaded data if available, otherwise returns the placeholder
     var data: T {
         get {
             switch self {
             case .loaded(let data):
                 return data
             case .idle(let placeholder), .loading(let placeholder), .failed(_, let placeholder):
                 return placeholder
             }
         }
         set {
             self = .loaded(newValue)
         }
     }
}

extension ViewStateEnum {
    var error: Error? {
        if case .failed(let error, _) = self {
            return error
        }
        return nil
    }
}
