//
//  GetDogsUseCase.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation
import RxSwift

public final class GetDogsUseCase {
    
    private let dogsAPI: DogsAPIType
    private let dogsPersistenceAPI: DogsPersistenceAPIType
    
    public init(dogsAPI: DogsAPIType,
                dogsPersistenceAPI: DogsPersistenceAPIType) {
        self.dogsAPI = dogsAPI
        self.dogsPersistenceAPI = dogsPersistenceAPI
    }
    
    public func execute() -> Observable<[Dog]> {
        
        dogsPersistenceAPI
            .getDogs()
            .ifEmpty(switchTo: dogsAPI
                .getDogs()
                .flatMapLatest({ [unowned self] (dogs) -> Observable<[Dog]> in
                    return self.dogsPersistenceAPI.save(dogs: dogs).flatMapLatest { (_) -> Observable<[Dog]> in
                        return .just(dogs)
                    }
            }))
    }
}
