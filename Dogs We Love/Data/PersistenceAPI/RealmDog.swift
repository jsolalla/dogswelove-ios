//
//  RealmDog.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation
import RealmSwift

public class RealmDog: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var information = ""
    @objc dynamic var age = 0
    @objc dynamic var image = ""
    
    public override static func primaryKey() -> String? {
        return "name"
    }
}
