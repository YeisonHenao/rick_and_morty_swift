//
//  RickAndMortyViewModelBinding.swift
//  rick_and_morty
//
//  Created by desarrollador3 on 18/10/23.
//

import Foundation

protocol RickAndMortyViewModelBinding {
    func dataLoaded(_ data: RickAndMortyModel)
    
    func errorOnDataLoad(_ error: RickAndMortyError)
}
