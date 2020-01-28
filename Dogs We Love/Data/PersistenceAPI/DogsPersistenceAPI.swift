//
//  DogsPersistenceAPI.swift
//  Dogs We Love
//
//  Created by Jesus Eduardo Santa Olalla Picazo  (Vendor) on 1/27/20.
//  Copyright © 2020 Codikas. All rights reserved.
//

import Foundation
import RxSwift
import RealmSwift

public final class DogsPersistenceAPI: DogsPersistenceAPIType {
    
    public func save(dogs: [Dog]) -> Observable<Void> {
        
        return Observable.create { observer in
            
            let realm = try! Realm()
            
            for dog in dogs {
                
                let realmDog = RealmDog()
                realmDog.from(dog: dog)
                
                try! realm.write {
                    realm.add(realmDog, update: .modified)
                }
                
            }
            
            observer.onNext(())
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
    public func getDogs() -> Observable<[Dog]> {
        
        return Observable.deferred {
            
            let realm = try! Realm()
            let realmDogs = realm.objects(RealmDog.self)
            let dogs = Array(realmDogs.map { $0.mapToDog() })
            
            if dogs.isEmpty {
                return .empty()
            } else {
                return .just(dogs)
            }
        }
    }
}
