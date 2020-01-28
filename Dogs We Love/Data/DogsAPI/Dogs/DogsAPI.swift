//
//  DogsAPI.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation
import RxSwift
import Moya

struct DogsAPI: RequestHandler {
    
    let provider: RequestService
    
    init(provider: RequestService) {
        self.provider = provider
    }
}

extension DogsAPI: DogsAPIType {
    
    func getDogs() -> Observable<[Dog]> {
        
        let endpoint = DogsEndpoint.getDogs
        let request: Observable<DogsResponseModel> = performRequest(endpoint)
        
        return request.flatMap { (dogsResponse) -> Observable<[Dog]> in
            return .just(dogsResponse.dogs.map { $0.mapToDog() })
        }
    }
}

