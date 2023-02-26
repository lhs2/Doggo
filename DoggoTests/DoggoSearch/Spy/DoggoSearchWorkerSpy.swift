//
//  DoggoSearchWorkerSpy.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import XCTest
@testable import Doggo

final class DoggoSearchWorkerSpySuccess: DoggoSearchWorkerProtocol {
    var isGetListCalled = false
    
    func getList(with name: String, completion: @escaping (DoggoSearchModel.ApiResponse?) -> Void) {
        let list = XCTestCase().loadDogList()
        completion(list)
    }
}

final class DoggoSearchWorkerSpyFailure: DoggoSearchWorkerProtocol {
    var isGetListCalled = false
    
    func getList(with name: String, completion: @escaping (DoggoSearchModel.ApiResponse?) -> Void) {
        completion(nil)
    }
}


