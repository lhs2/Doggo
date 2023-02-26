//
//  DoggoSearchInteractorSpy.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import Foundation
@testable import Doggo

final class DoggoSearchInteractorSpy: DoggoSearchInteractorProtocol {
    var isRequestSearchCalled = false
    
    func requestSearch(by name: String) {
        isRequestSearchCalled = true
    }
    
}
