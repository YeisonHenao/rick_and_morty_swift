//
//  RickAndMortyProtocol.swift
//  rick_and_morty
//
//  Created by desarrollador3 on 17/10/23.
//

import Foundation

protocol RickAndMortyProtocol {
    func fetch() async throws -> RickAndMortyModel
}
