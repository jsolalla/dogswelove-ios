//
//  RequestSampleData.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation

struct RequestSampleData {
    
    let bundle: Bundle?
    
    init() {
        self.bundle = Bundle(identifier: "com.codikas.Dogs-We-Love")
    }
    
    func getData(for fileName: String) -> Data {
     
        guard let url = bundle?.url(forResource: fileName, withExtension: "json") else { return Data() }
        guard let data = try? Data(contentsOf: url) else { return Data() }
        
        return data
    }
}
