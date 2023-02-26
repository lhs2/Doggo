//
//  DoggoDetailsPresenterSpy.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation
@testable import Doggo

final class DoggoDetailsPresenterSpy: DoggoDetailsPresenterProtocol {
    var isPresentDogInfoCalled = false
    
    func presentDogInfo(with response: DoggoDetailsModel.Response) {
        isPresentDogInfoCalled = true
    }
    
    
}
