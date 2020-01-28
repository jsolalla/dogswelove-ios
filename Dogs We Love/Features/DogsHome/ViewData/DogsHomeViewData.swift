//
//  DogsHomeViewData.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation

public struct DogsHomeViewData: DogsHomeViewDataType {
    
    public let dog: Dog
    
    public init(dog: Dog) {
        self.dog = dog
    }
    
    public var name: String {
        return dog.name
    }
    
    public var information: String {
        return dog.description
    }
    
    public var age: String {
        return "dogsWeLove.almost".localized + " \(dog.age) " + "dogsWeLove.years".localized
    }
    
    public var imageURL: URL? {
        return URL(string: dog.image.replacingOccurrences(of: " ", with: ""))
    }
}
