//
//  DoggoDetailsInteractorSpy.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation
@testable import Doggo

final class DoggoDetailsInteractorSpy: DoggoDetailsInteractorProtocol {
    var isPresentDogInfoCalled = false
    var dog: DoggoDetailsModel.DataInput
    
    func presentDogInfo() {
        isPresentDogInfoCalled = true
    }
    
    init() {
        let mock = DoggoDetailsModel.Dog(id: nil,
                                       name: nil,
                                       breed_group: nil,
                                       temperament: nil,
                                       origin: nil,
                                       image: nil)
        dog = .init(data: mock)
    }
    
}
