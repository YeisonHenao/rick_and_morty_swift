//
//  RickAndMortyViewModelTest.swift
//  rick_and_mortyTests
//
//  Created by desarrollador3 on 19/10/23.
//

import XCTest
@testable import rick_and_morty

final class RickAndMortyViewModelTest: XCTestCase {
    
    //Inicialización de sut = Subject under Test(Sujeto bajo pruebas)
    private var sut: RickAndMortyViewModel!
    
    //Mocks de las clases necesarias para verificar funciones del ViewModel
    private var mockRepository: MockRickAndMortyRepository!
    private var mockBinding: MockRickAndMortyViewModelBinding!
    
    override func setUpWithError() throws {
        // Put setup code here. 
        // This method is called before the invocation of each test method in the class.
        
        //Inicialización de todas las clases para uso en estos test
        mockRepository = MockRickAndMortyRepository()
        mockBinding = MockRickAndMortyViewModelBinding()
        
        sut = RickAndMortyViewModel(repository: mockRepository)
        sut.setBinding(mockBinding)
    }

    override func tearDownWithError() throws {
        mockRepository = nil
        mockBinding = nil
        sut = nil
    }

    
    //Mock del repositorio de Rick And Morty
    final class MockRickAndMortyRepository: RickAndMortyProtocol {
        var resultAsync: RickAndMortyModel?
        
        func fetch() async throws -> RickAndMortyModel {
            if let resultAsync { return resultAsync }
            
            throw RickAndMortyError.generic
        }
    }
    
    //Mock del Binding para cuando llegue la info al repositorio
    final class MockRickAndMortyViewModelBinding: RickAndMortyViewModelBinding {
        var dataLoadedWasCalled: Bool = false
        func dataLoaded(_ data: RickAndMortyModel) {
            dataLoadedWasCalled = true
        }
        
        var errorOnDataLoadedWasCalled: Bool = false
        func errorOnDataLoad(_ error: RickAndMortyError) {
            errorOnDataLoadedWasCalled = true
        }
    }
}
