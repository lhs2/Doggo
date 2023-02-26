//
//  DoggoSearchIntegrationTest.swift
//  DoggoTests
//
//  Created by Luiz Henrique on 26/02/2023.
//

import XCTest
@testable import Doggo

class DoggoSearchIntegrationTest: XCTestCase {
    var viewController: DoggoSearchViewController!
    
    override func setUpWithError() throws {
        let factory = DoggoSearchFactory()
        viewController = factory.newInstance()
    }

    override func tearDownWithError() throws {
    }

    func testFlow() throws {
        //When
        viewController.loadViewIfNeeded()
        
        //Then

    }

}
