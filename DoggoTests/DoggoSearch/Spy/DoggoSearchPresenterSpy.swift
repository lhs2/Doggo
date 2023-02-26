//
//  DoggoSearchPresenterSpy.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation
@testable import Doggo


final class DoggoSearchPresenterSpy: DoggoSearchPresenterProtocol {
    var isPresentDoggoListCalled = false
    var isPresentErrorCalled = false
    
    func presentDoggoList(with response: DoggoSearchModel.Response) {
        isPresentDoggoListCalled = true
    }
    
    func presentError(with error: DoggoSearchModel.ErrorCase) {
        isPresentErrorCalled = true
    }
    
    
}
