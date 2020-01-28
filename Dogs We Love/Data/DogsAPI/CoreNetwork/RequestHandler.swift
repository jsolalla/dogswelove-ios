//
//  RequestHandler.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation
import RxSwift
import RxMoya
import Moya

public protocol RequestHandler {
    var provider: RequestService { get }
}

public extension RequestHandler {
    
    func performRequest<T: Decodable>(_ endpoint: TargetType) -> Observable<T> {
        
        return Observable.create { observer in
            
            _ = self.provider.request(request: endpoint)
                .filterSuccessfulStatusCodes()
                .map(T.self)
                .subscribe { event in
                    
                    switch event {
                    case .success(let response):
                        observer.onNext(response)
                        observer.onCompleted()
                    case .error(let error):
                        observer.onError(error)
                        observer.onCompleted()
                    }
            }
            
            return Disposables.create()
        }
    }
}
