//
//  DogsHomeViewModel+Dependencies.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation

public typealias DogsHomeViewModelDependencies = (
    getDogs: GetDogsUseCase,
    useMockData: Bool // not necessary, just to show the advantage of using typealias to declare the dependencies
)
