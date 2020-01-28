//
//  DogResponseModel.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation

struct DogsResponseModel: Decodable {
    
    var dogs: [DogResponseModel]
    
    init(from decoder: Decoder) throws {
        
        var dogs = [DogResponseModel]()
        var container = try decoder.unkeyedContainer()
        
        while !container.isAtEnd {
            if let route = try? container.decode(DogResponseModel.self) {
                dogs.append(route)
            }
        }
        
        self.dogs = dogs
    }
}

struct DogResponseModel: Decodable {
    
    let dogName: String
    let description: String
    let age: Int
    let url: String
    
}
