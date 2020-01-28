//
//  DogsAPITests.swift
//  Dogs We LoveTests
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import XCTest
import RxSwift

@testable import Dogs_We_Love

class DogsAPITests: XCTestCase {

    var disposeBag: DisposeBag?
    var dogsAPI: DogsAPIType?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        disposeBag = DisposeBag()
        dogsAPI = DogsAPI(provider: RequestServiceProvider(useSampleData: true))
    }

    override func tearDown() {
        disposeBag = nil
        dogsAPI = nil
    }

    func testSuccessfulDogsAPI() {
        
        let promise = expectation(description: "DogsAPI")
        var dogs: [Dog]?
        
        guard let disposeBag = disposeBag else {
            XCTFail("Disposebag not initialized")
            return
        }
        
        dogsAPI?.getDogs().subscribe(onNext: { (dogsResponse) in
            dogs = dogsResponse
            promise.fulfill()
        }, onError: { (error) in
            XCTFail(error.localizedDescription)
        }).disposed(by: disposeBag)
        
        wait(for: [promise], timeout: 5)
        XCTAssertNotNil(dogs)
    }

}
