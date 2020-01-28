//
//  AppCoordinator.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {
    
    public var rootViewController: UIViewController?
    
    public init() { }
    
    public func start() {
        configureFlow()
        configureAppeareance()
    }
    
    private func configureAppeareance() {
        
        /// UINavigationBar appearance
        UINavigationBar.appearance().titleTextAttributes = [.font: UIFont.systemFont(ofSize: 24, weight: .regular),
                                                            .foregroundColor: UIColor.app(color: .black)]
        
        UINavigationBar.appearance().barTintColor = UIColor.app(color: .white)
        UINavigationBar.appearance().tintColor = UIColor.app(color: .black)
        UINavigationBar.appearance().shadowImage = UIImage()
    }
    
    private func configureFlow() {
        let dogsHomeCoordinator = DogsHomeCoordinator()
        self.rootViewController = dogsHomeCoordinator.navigationController
    }
}
