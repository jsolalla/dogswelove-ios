//
//  DogsHome+Components.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation

public enum DogsHomeComponent {
     
    var id: String {
        switch self {
        case .info(let dog):
            return dog.name
        }
    }
    
    case info(dog: DogsHomeViewDataType)
    
    /*
     case cat(cat: Cat) -> We can use enum to leverage rendering ordered data on views,
                           always trying to keep cyclomatic complexity as low as possible
    */
    
    
}

extension DogsHomeComponent: Hashable {
    
    public static func == (lhs: DogsHomeComponent, rhs: DogsHomeComponent) -> Bool {
        return lhs.id == rhs.id
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}
