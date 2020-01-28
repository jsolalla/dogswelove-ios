//
//  DogsHomeViewDataType.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation

public protocol DogsHomeViewDataType {
    var name: String { get }
    var information: String { get}
    var age: String { get }
    var imageURL: URL? { get }
}
