//
//  DogsHome+Coordinator.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import UIKit

public protocol DogsHomeCoordinatorType {
    func goToDetail(dog: Dog)
    func goToAnyOtherView()
}

final class DogsHomeCoordinator {
    
    var navigationController: UINavigationController?
    
    init() {
        let dogsHomeViewController = DogsHomeFactory.makeView(coordinator: self)
        self.navigationController = UINavigationController(rootViewController: dogsHomeViewController)
    }
    
}

extension DogsHomeCoordinator: DogsHomeCoordinatorType {
    
    func goToDetail(dog: Dog) {
        
    }
    
    func goToAnyOtherView() {
        
    }
}
