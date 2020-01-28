//
//  DogsPersistenceAPIType.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation
import RxSwift

public protocol DogsPersistenceAPIType {
    func save(dogs: [Dog]) -> Observable<Void>
    func getDogs() -> Observable<[Dog]>
}
