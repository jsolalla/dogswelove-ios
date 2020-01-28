//
//  UIColor+Extensions.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import UIKit

public enum AssetsColor: String {
    case black
    case gray
    case white
}

public extension UIColor {
    
    class func app(color: AssetsColor) -> UIColor? {
        
        guard let assetColor = UIColor(named: color.rawValue) else {
            assertionFailure("The asset color does not exists within assets")
            return nil
        }
        
        return assetColor
    }
}

