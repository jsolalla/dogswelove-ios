//
//  DogsPersistenceAPI.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation
import RxSwift

public final class DogsPersistenceAPI: DogsPersistenceAPIType {
    
    public func save(dogs: [Dog]) -> Observable<Void> {
        return Observable.just(())
    }
    
    public func getDogs() -> Observable<[Dog]> {
        return Observable.just([])
    }
}
