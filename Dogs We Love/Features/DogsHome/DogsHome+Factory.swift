//
//  DogsHome+Factory.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation

public protocol DogsHomeFactoryType {
    static func makeView(coordinator: DogsHomeCoordinatorType) -> DogsHomeViewController
}

public class DogsHomeFactory: DogsHomeFactoryType {
    
    public static func makeView(coordinator: DogsHomeCoordinatorType) -> DogsHomeViewController {
        
        let provider: RequestService = RequestServiceProvider(useSampleData: false)
        let dogsAPI: DogsAPIType = DogsAPI(provider: provider)
        let dogsPersistenceAPI: DogsPersistenceAPIType = DogsPersistenceAPI()
        
        let getDogsUseCase = GetDogsUseCase(dogsAPI: dogsAPI,
                                            dogsPersistenceAPI: dogsPersistenceAPI)
        
        let viewModelDependencies = DogsHomeViewModelDependencies(getDogs: getDogsUseCase,
                                                                  useMockData: false)
        
        let viewModel: DogsHomeViewModelType = DogsHomeViewModel(dependencies: viewModelDependencies)
        let viewController = DogsHomeViewController(viewModel: viewModel, coordinator: coordinator)
        
        return viewController
    }
}
