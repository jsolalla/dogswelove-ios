//
//  RequestService.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation
import Moya
import RxMoya
import RxSwift

public protocol RequestService {
    func request(request: TargetType) -> Single<Moya.Response>
}

public struct RequestServiceProvider: RequestService {
    
    private let provider: MoyaProvider<MultiTarget>
    
    public init(useSampleData: Bool = false) {
        self.provider = MoyaProvider<MultiTarget>(stubClosure: useSampleData ? MoyaProvider.immediatelyStub : MoyaProvider.neverStub,
                                                  plugins: [NetworkLoggerPlugin(verbose: true)])
    }
    
    public func request(request: TargetType) -> Single<Response> {
        return provider.rx.request(MultiTarget(request))
    }
}
