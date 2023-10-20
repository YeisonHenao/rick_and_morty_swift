//
//  RickAndMortyError.swift
//  rick_and_morty
//
//  Created by desarrollador3 on 17/10/23.
//

import Foundation

enum RickAndMortyError: Error {
    case generic
    case invalidUrl
    case decodeFailed
    
    var message: String {
        switch self {
        case .generic:
            return "generic"
        case .invalidUrl:
            return "invalidUrl"
        case .decodeFailed:
            return "decodeFailed"
        }
    }
}
