//
//  RickAndMortyViewController.swift
//  rick_and_morty
//
//  Created by desarrollador3 on 18/10/23.
//

import Foundation
import UIKit

class RickAndMortyViewController: UIViewController {

    private let viewModel : RickAndMortyViewModel
    
    init(viewModel: RickAndMortyViewModel = RickAndMortyViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        loadData()
    }
    
    private func setup(){
        viewModel.setBinding(self)
        view.backgroundColor = .cyan
    }
    
    private func loadData(){
        Task { await viewModel.getDataAsync() }
    }
    
    
}

extension RickAndMortyViewController: RickAndMortyViewModelBinding {
    func dataLoaded(_ data: RickAndMortyModel) {
        DispatchQueue.main.async {
            print("\n:::::::: DATA ::::::::")
            data.results.forEach { print($0.name ?? "") }
            print("::::::::::::::::::::::::::::\n")
        }
    }
    
    func errorOnDataLoad(_ error: RickAndMortyError) {
        DispatchQueue.main.async {
            print("\n:::::::: Error ::::::::")
            print(error.message)
            print("::::::::::::::::::::::::::::\n")
        }
    }
}
