//
//  ViewController.swift
//  rick_and_morty
//
//  Created by desarrollador3 on 17/10/23.
//

import Foundation
import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .cyan
        
        let button = UIButton(type: .system)
        button.setTitle("Ir a vista", for: .normal)
        button.backgroundColor = .red
        button.tintColor = .white
        button.addTarget(self, action: #selector(goToSecondView), for: .touchUpInside)
        button.frame = CGRect(x: 50, y: 100, width: 200, height: 40)
        
        view.addSubview(button)
    }
    
    @objc func goToSecondView(){
        let secondViewController = RickAndMortyViewController()
        
        navigationController?.pushViewController(secondViewController, animated: true)
    }
    
}

    
