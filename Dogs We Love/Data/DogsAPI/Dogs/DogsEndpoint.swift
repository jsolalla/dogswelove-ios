//
//  DogsEndpoint.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation
import Moya

enum DogsEndpoint: TargetType {

    case getDogs

    var baseURL: URL {
        return URL(staticString: "https://api.myjson.com")
    }
    
    var path: String {
        return "bins/kp2e8"
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        let sample = RequestSampleData()
        let data = sample.getData(for: "SampleDogsAPI")
        return data
    }
    
    var task: Task {
        switch self {
        case .getDogs:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json", "Accept": "application/json"]
    }
}
