//
//  RickAndMortyViewModelProtocol.swift
//  rick_and_morty
//
//  Created by desarrollador3 on 18/10/23.
//

import Foundation

protocol RickAndMortyViewModelProtocol {
    func getDataAsync() async
    
    func setBinding(_ binding: RickAndMortyViewModelBinding)
}
