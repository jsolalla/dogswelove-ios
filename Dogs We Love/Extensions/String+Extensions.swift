//
//  String+Extensions.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation

public extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
