//
//  URL+Extensions.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation

extension URL {
    
    init(staticString string: String) {
        
        guard let url = URL(string: string) else {
            preconditionFailure("Invalid static URL string: \(string)")
        }

        self = url
    }
}
