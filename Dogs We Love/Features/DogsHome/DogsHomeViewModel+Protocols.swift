//
//  DogsHomeViewModel+Protocols.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol DogsHomeViewModelOutputs {
    var components: BehaviorRelay<[DogsHomeComponent]> { get }
    var isLoading: BehaviorRelay<Bool> { get }
    var error: PublishSubject<Error> { get }
}

public protocol DogsHomeViewModelType {
    var outputs: DogsHomeViewModelOutputs { get }
}

