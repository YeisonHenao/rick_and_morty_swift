//
//  RickAndMortyRepository.swift
//  rick_and_morty
//
//  Created by desarrollador3 on 18/10/23.
//

import Foundation

final class RickAndMortyRepository: RickAndMortyProtocol {
    
    private let url: String = "https://rickandmortyapi.com/api/character"
    
    private func buildUrl() throws -> URL {
        guard let apiServiceUrl = URL(string: self.url) else {
            throw RickAndMortyError.invalidUrl
        }
        return apiServiceUrl
    }
    
    func fetch() async throws -> RickAndMortyModel {
        let apiServiceUrl = try buildUrl()
        
        let (serviceData, _) = try await URLSession.shared.data(from: apiServiceUrl)
        
        guard let data = try? JSONDecoder().decode(RickAndMortyModel.self, from: serviceData) else {
            throw RickAndMortyError.decodeFailed
        }
        
        return data
        
    }
        
}
