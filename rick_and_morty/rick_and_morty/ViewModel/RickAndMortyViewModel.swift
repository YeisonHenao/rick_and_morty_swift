//
//  RickAndMortyViewModel.swift
//  rick_and_morty
//
//  Created by desarrollador3 on 18/10/23.
//

import Foundation

final class RickAndMortyViewModel: RickAndMortyViewModelProtocol {
        
    private let repository: RickAndMortyProtocol
    var binding: RickAndMortyViewModelBinding?
    
    init(repository: RickAndMortyProtocol = RickAndMortyRepository()) {
        self.repository = repository
    }
    
    func setBinding(_ binding: RickAndMortyViewModelBinding) {
        self.binding = binding
    }
    
    func getDataAsync() async {
        do {
            let data = try await repository.fetch()
            binding?.dataLoaded(data)
        }
        catch let error as RickAndMortyError{
            binding?.errorOnDataLoad(error)
        }
        catch {
            binding?.errorOnDataLoad(RickAndMortyError.generic)
        }
    }
    
}
