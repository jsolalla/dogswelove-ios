//
//  RealmDog+Mapper.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation

extension RealmDog {
    
    func mapToDog() -> Dog {
        return Dog(name: name,
                   description: information,
                   age: age,
                   imageUrl: URL(string: image))
    }
}
