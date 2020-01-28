//
//  DogsHomeViewModel.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/28/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public final class DogsHomeViewModel: DogsHomeViewModelType, DogsHomeViewModelOutputs {
    
    // MARK: DogsHomeViewModelType
    public var outputs: DogsHomeViewModelOutputs { return self }
    
    // MARK: Properties
    private let dependencies: DogsHomeViewModelDependencies
    private let disposeBag: DisposeBag
    
    // MARK: Outputs
    public let components = BehaviorRelay<[DogsHomeComponent]>(value: [])
    public let isLoading = BehaviorRelay<Bool>(value: false)
    public let error: PublishSubject<Error>
    
    public init(dependencies: DogsHomeViewModelDependencies) {
        
        self.dependencies = dependencies
        self.disposeBag = DisposeBag()
        self.error = PublishSubject()
        
        self.isLoading.accept(true)
        self.dependencies
            .getDogs
            .execute()
            .subscribe(onNext: { [weak self] (dogs) in
            
                let viewDatas = dogs.map { DogsHomeViewData(dog: $0) }
                let components = viewDatas.map { DogsHomeComponent.info(dog: $0 )}
                
                self?.components.accept(components)
                self?.isLoading.accept(false)
                
        }, onError: { [weak self] (error) in
            self?.isLoading.accept(false)
            self?.error.onNext(error)
        }).disposed(by: disposeBag)
    }
}
