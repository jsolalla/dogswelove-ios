//
//  Dog.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation

public struct Dog {
    
    public let name: String
    public let description: String
    public let age: Int
    public let image: String
    
    public init(name: String,
                description: String = "",
                age: Int = 0,
                image: String = "") {
        
        self.name = name
        self.description = description
        self.age = age
        self.image = image
    }
}
